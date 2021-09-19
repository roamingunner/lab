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

```
MemTotal:         119652 kB
MemFree:           93308 kB
MemAvailable:     104160 kB
Buffers:            1656 kB
Cached:            10408 kB
SwapCached:            0 kB
Active:             7876 kB
Inactive:           5988 kB
Active(anon):       1808 kB
Inactive(anon):      380 kB
Active(file):       6068 kB
Inactive(file):     5608 kB
Unevictable:           0 kB
Mlocked:               0 kB
SwapTotal:             0 kB
SwapFree:              0 kB
Dirty:               212 kB
Writeback:             0 kB
AnonPages:          1816 kB
Mapped:             7116 kB
Shmem:               388 kB
KReclaimable:       4268 kB
Slab:               8580 kB
SReclaimable:       4268 kB
SUnreclaim:         4312 kB
KernelStack:         448 kB
PageTables:          144 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:       59824 kB
Committed_AS:      12296 kB
VmallocTotal:    1949696 kB
VmallocUsed:        2096 kB
VmallocChunk:          0 kB
Percpu:              304 kB
CmaTotal:          16384 kB
CmaFree:           16128 kB

```

storage usage

```
Filesystem                Size      Used Available Use% Mounted on
/dev/root                62.0M     20.8M     38.0M  35% /
devtmpfs                 49.9M         0     49.9M   0% /dev
tmpfs                    58.4M         0     58.4M   0% /dev/shm
tmpfs                    23.4M    388.0K     23.0M   2% /run
tmpfs                     4.0M         0      4.0M   0% /sys/fs/cgroup
tmpfs                    58.4M         0     58.4M   0% /tmp

```
