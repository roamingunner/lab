# test systemd on arm platfrom

## dependencies

* qemu-system-arm 

## usage

* `./run.sh`
* login password is `root`

## build

* build zImage/rootfs.ext2/dtb throught buildroot(https://github.com/roamingunner/buildroot)
* disable all of system optional in buildroot
* add dropbear


## result

process memory usage data is in share smemdata.tar

```
leo@leo-vm:~/work/qemu_arm$ smem -S share/smemdata.tar  -k
  PID User     Command                         Swap      USS      PSS      RSS
  122 0        /usr/sbin/dropbear -F -R           0   304.0K   453.0K     1.2M
  134 0        smemcap                            0   156.0K   465.0K     1.3M
  106 0        -sh                                0   232.0K   584.0K     1.6M
   92 0        /usr/bin/dbus-daemon --syst        0     1.1M     1.4M     2.4M
   73 0        /usr/lib/systemd/systemd-jo        0   716.0K     1.4M     3.2M
   77 0        /usr/lib/systemd/systemd-ud        0   692.0K     1.5M     3.4M
    1 0        /sbin/init                         0     2.4M     3.1M     4.9M
```
