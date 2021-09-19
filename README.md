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
   77 0        /sbin/syslogd -n                   0    60.0K   285.0K     1.2M
    1 0        init                               0    80.0K   301.0K     1.2M
   81 0        /sbin/klogd -n                     0    68.0K   312.0K     1.3M
  141 0        smemcap                            0   128.0K   348.0K     1.2M
  126 0        /usr/sbin/dropbear -R              0   308.0K   470.0K     1.2M
  127 0        -sh                                0   204.0K   471.0K     1.4M
```


```
# cat /proc/meminfo
MemTotal:         119652 kB
MemFree:          105640 kB
MemAvailable:     106948 kB
Buffers:             384 kB
Cached:             3032 kB
SwapCached:            0 kB
Active:             3168 kB
Inactive:            672 kB
Active(anon):        448 kB
Inactive(anon):       16 kB
Active(file):       2720 kB
Inactive(file):      656 kB
Unevictable:           0 kB
Mlocked:               0 kB
SwapTotal:             0 kB
SwapFree:              0 kB
Dirty:                12 kB
Writeback:             0 kB
AnonPages:           440 kB
Mapped:             1712 kB
Shmem:                40 kB
KReclaimable:       2864 kB
Slab:               6324 kB
SReclaimable:       2864 kB
SUnreclaim:         3460 kB
KernelStack:         448 kB
PageTables:           88 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:       59824 kB
Committed_AS:       2000 kB
VmallocTotal:    1949696 kB
VmallocUsed:        2092 kB
VmallocChunk:          0 kB
Percpu:              304 kB
CmaTotal:          16384 kB
CmaFree:           16128 kB

```


storage usage

```
Filesystem                Size      Used Available Use% Mounted on
/dev/root                62.0M      7.6M     51.2M  13% /
devtmpfs                 49.9M         0     49.9M   0% /dev
tmpfs                    58.4M         0     58.4M   0% /dev/shm
tmpfs                    58.4M     20.0K     58.4M   0% /tmp
tmpfs                    58.4M     20.0K     58.4M   0% /run
```
