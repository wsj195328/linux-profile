#!/bin/bash
free -m |grep -i mem |awk '{if($4 < 280){ printf("3") > "/proc/sys/vm/drop_caches"}}';
