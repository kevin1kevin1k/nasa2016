#!/usr/bin/env bash
# NASA 2016
# SA 1.2
# By B03902086
#
# Usage: ./total_mem_usage_list.sh

get_ABC() {
  ps aux | 
    cut -c -3 | 
      sort | 
        uniq | 
          grep '[[:lower:]][[:digit:]]\{2\}'
}

join -o 1.2 2.2 <(get_ABC | nl) <(get_ABC | xargs -L 1 ./total_mem_usage.sh | nl) | 
  sort -k2nr
