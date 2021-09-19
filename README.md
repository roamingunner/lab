# test systemd on arm platfrom

## dependencies

* qemu-system-arm 

## usage

* `./run.sh`
* login password is `root`
* if want to share folder with host , run this command `mkdir /share && mount -t 9p hostshare /share`

## build

* build zImage/rootfs.ext2/dtb throught buildroot(https://github.com/roamingunner/buildroot)
* disable all of system optional in buildroot
* add dropbear


## result

process memory usage data is in share smemdata.tar

```
leo@leo-vm:~/work/buildroot_for_qemu/output/images$ smem -S share/smemdata.tar  -k
  PID User     Command                         Swap      USS      PSS      RSS
  946 0        /sbin/syslogd -n                   0    60.0K   283.0K     1.2M
    1 0        /sbin/init                         0   128.0K   291.0K  1016.0K
  951 0        /sbin/klogd -n                     0    68.0K   301.0K     1.3M
 1032 0        supervise-daemon agetty.tty        0   168.0K   319.0K  1012.0K
 1050 0        smemcap                            0   136.0K   360.0K     1.2M
 1004 0        /usr/sbin/dropbear -R              0   296.0K   436.0K     1.2M
 1033 0        -sh                                0   216.0K   511.0K     1.6M

```


```
# cat /proc/meminfo
MemTotal:         119652 kB
MemFree:          103736 kB
MemAvailable:     106132 kB
Buffers:             560 kB
Cached:             3928 kB
SwapCached:            0 kB
Active:             4224 kB
Inactive:            860 kB
Active(anon):        672 kB
Inactive(anon):       84 kB
Active(file):       3552 kB
Inactive(file):      776 kB
Unevictable:           0 kB
Mlocked:               0 kB
SwapTotal:             0 kB
SwapFree:              0 kB
Dirty:                 0 kB
Writeback:             0 kB
AnonPages:           612 kB
Mapped:             1824 kB
Shmem:               160 kB
KReclaimable:       3136 kB
Slab:               6972 kB
SReclaimable:       3136 kB
SUnreclaim:         3836 kB
KernelStack:         424 kB
PageTables:          108 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:       59824 kB
Committed_AS:       2532 kB
VmallocTotal:    1949696 kB
VmallocUsed:        2092 kB
VmallocChunk:          0 kB
Percpu:              304 kB
CmaTotal:          16384 kB
CmaFree:           16128 kB

```


storage usage

```
# df -h
Filesystem                Size      Used Available Use% Mounted on
/dev/root                62.0M     10.0M     48.8M  17% /
devtmpfs                 10.0M         0     10.0M   0% /dev
tmpfs                    58.4M    120.0K     58.3M   0% /run
cgroup_root              10.0M         0     10.0M   0% /sys/fs/cgroup
shm                      58.4M         0     58.4M   0% /dev/shm
tmpfs                    58.4M     40.0K     58.4M   0% /tmp
```
