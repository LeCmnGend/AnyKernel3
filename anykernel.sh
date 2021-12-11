# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=FuanDo Kernel by @LeCmnGend
do.devicecheck=1
do.modules=1
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
device.name1=ginkgo
device.name2=willow
device.name3=
device.name4=
device.name5=
supported.versions=10 - 12
supported.patchlevels=2021-10-01
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=auto;
ramdisk_compression=auto;
keep_vbmeta_flag=auto;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;

set_perm_recursive 0 0 755 644 $ramdisk/overlay.d/*;
set_perm_recursive 0 0 750 750 $ramdisk/overlay.d/init* $ramdisk/overlay.d/sbin;

## AnyKernel boot install
dump_boot;

write_boot;
## end boot install


# shell variables
#block=vendor_boot;
#is_slot_device=1;
#ramdisk_compression=auto;

# reset for vendor_boot patching
#reset_ak;


## AnyKernel vendor_boot install
#split_boot; # skip unpack/repack ramdisk since we don't need vendor_ramdisk access

#flash_boot;
## end vendor_boot install

