#!/usr/bin/env bash
# NASA 2016
# SA 1.1
# By B03902086
#
# Usage: ./total_mem_usage.sh b04

ps aux | 
  grep ^$1 |
    awk 'BEGIN { sum=0 } { sum+=$5 } END { print sum }'
