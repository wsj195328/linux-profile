# when memory less 400, free memory
free -m |grep -i mem |awk '{if($4 < 340){ printf("3") > "/proc/sys/vm/drop_caches"}}';
