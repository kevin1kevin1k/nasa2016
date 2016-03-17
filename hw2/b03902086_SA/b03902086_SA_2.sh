#!/usr/bin/env bash
# NASA 2016
# SA 2.2
# By B03902086

lvresize -r -L-100G /dev/nasavg/home_ta
lvresize -r -L+100G /dev/nasavg/home_student
