free -m |grep -i mem |awk '{if($4 < 350){ printf("3") > "/proc/sys/vm/drop_caches"}}';
