#!/system/bin/sh 

# Force doubletab to wake
	echo 1 > /sys/touchpanel/double_tap

echo "Ginkgo Boot Completed" >> /dev/kmsg
