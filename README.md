# docker registry storage layout


- run docker registry on local host `docker run --rm -d -p 5000:5000 --name registry registry`
- push two different version busybox images to local registry
```
docker pull busybox:1.29.2
docker tag busybox:1.29.2 localhost:5000/busybox:1.29.2
docker push localhost:5000/busybox:1.29.2
docker pull busybox
docker tag busybox localhost:5000/busybox
docker push localhost:5000/busybox:latest
```
- build a multi-arch image and push them to local registry `docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 --push -t localhost:5000/hello .` (In order to push image to local registry, buildx instance need to be `create` with `--driver-opt network=host` [link](https://github.com/docker/buildx/issues/59) )
- Then we login in registry container `sudo docker exec -it registry /bin/sh`. And contents are stored in `/var/lib/registry`

```
/ # tree /var/lib/registry/docker/registry/v2/
/var/lib/registry/docker/registry/v2/
├── blobs
│   └── sha256
│       ├── 13
│       │   └── 136482bf81d1fa351b424ebb8c7e34d15f2c5ed3fc0b66b544b8312bda3d52d9
│       │       └── data
│       ├── 25
│       │   └── 25d8449aaee3ae508a1faa391b1a5faca1468a2802e1283caff1748566976cca
│       │       └── data
│       ├── 2a
│       │   └── 2a67ce01ed34ac54fcd76582b1c2941da0271d64131b9900ca3982b1c38dbef5
│       │       └── data
│       ├── 55
│       │   └── 5579e3dcd845bd5a516b6f0fdfec0a30e8956cfbbb50aaf01b69d459da956cf4
│       │       └── data
│       ├── 58
│       │   ├── 5843afab387455b37944e709ee8c78d7520df80f8d01cf7f861aae63beeddb6b
│       │   │   └── data
│       │   └── 58ab47519297212468320b23b8100fc1b2b96e8d342040806ae509a778a0a07a
│       │       └── data
│       ├── 5e
│       │   └── 5e8e0509e829bb8f990249135a36e81a3ecbe94294e7a185cc14616e5fad96bd
│       │       └── data
│       ├── 69
│       │   └── 69593048aa3acfee0f75f20b77acb549de2472063053f6730c4091b53f2dfb02
│       │       └── data
│       ├── 7b
│       │   └── 7b880f0c58d0c2a0f79848cdda36be866b83f48a656c7c6f632c7f4d1d7570ff
│       │       └── data
│       ├── 8c
│       │   └── 8c5a7da1afbc602695fcb2cd6445743cec5ff32053ea589ea9bd8773b7068185
│       │       └── data
│       ├── a9
│       │   └── a9629b29bbee6a3295e42733d471b6b5958c7d7b1fb5cd484ffeeee58deaa01a
│       │       └── data
│       ├── b2
│       │   └── b29593be8c091e983a93b0d7424bbdccdb4edb927b0658e1318013b9bc9c624a
│       │       └── data
│       ├── b7
│       │   └── b71f96345d44b237decc0c2d6c2f9ad0d17fde83dad7579608f1f0764d9686f2
│       │       └── data
│       ├── c0
│       │   └── c07946da999e3491cdd26b0731ef18829e6685ceff95cb55485b8d8e52ab9076
│       │       └── data
│       ├── d8
│       │   └── d862234546d177fc7fe855f260798aa63c9a5e004634a0f01a91a963b8901d9c
│       │       └── data
│       ├── dc
│       │   └── dca71257cd2e72840a21f0323234bb2e33fea6d949fa0f21c5102146f583486b
│       │       └── data
│       ├── e1
│       │   └── e1ddd7948a1c31709a23cc5b7dfe96e55fc364f90e1cebcde0773a1b5a30dcda
│       │       └── data
│       ├── e4
│       │   └── e479c7e8dd54aec068c1f2434e5adc1bf5a698dfd8663a0e861bb6ec08f13c7c
│       │       └── data
│       └── ee
│           └── eee9c02c45b346a4cc99aeada120445660c713d052a7fe4a44474600b2efa0c6
│               └── data
└── repositories
    ├── busybox
    │   ├── _layers
    │   │   └── sha256
    │   │       ├── 69593048aa3acfee0f75f20b77acb549de2472063053f6730c4091b53f2dfb02
    │   │       │   └── link
    │   │       ├── 8c5a7da1afbc602695fcb2cd6445743cec5ff32053ea589ea9bd8773b7068185
    │   │       │   └── link
    │   │       ├── b71f96345d44b237decc0c2d6c2f9ad0d17fde83dad7579608f1f0764d9686f2
    │   │       │   └── link
    │   │       └── e1ddd7948a1c31709a23cc5b7dfe96e55fc364f90e1cebcde0773a1b5a30dcda
    │   │           └── link
    │   ├── _manifests
    │   │   ├── revisions
    │   │   │   └── sha256
    │   │   │       ├── 5e8e0509e829bb8f990249135a36e81a3ecbe94294e7a185cc14616e5fad96bd
    │   │   │       │   └── link
    │   │   │       └── dca71257cd2e72840a21f0323234bb2e33fea6d949fa0f21c5102146f583486b
    │   │   │           └── link
    │   │   └── tags
    │   │       ├── 1.29.2
    │   │       │   ├── current
    │   │       │   │   └── link
    │   │       │   └── index
    │   │       │       └── sha256
    │   │       │           └── 5e8e0509e829bb8f990249135a36e81a3ecbe94294e7a185cc14616e5fad96bd
    │   │       │               └── link
    │   │       └── latest
    │   │           ├── current
    │   │           │   └── link
    │   │           └── index
    │   │               └── sha256
    │   │                   └── dca71257cd2e72840a21f0323234bb2e33fea6d949fa0f21c5102146f583486b
    │   │                       └── link
    │   └── _uploads
    └── hello
        ├── _layers
        │   └── sha256
        │       ├── 136482bf81d1fa351b424ebb8c7e34d15f2c5ed3fc0b66b544b8312bda3d52d9
        │       │   └── link
        │       ├── 5579e3dcd845bd5a516b6f0fdfec0a30e8956cfbbb50aaf01b69d459da956cf4
        │       │   └── link
        │       ├── 5843afab387455b37944e709ee8c78d7520df80f8d01cf7f861aae63beeddb6b
        │       │   └── link
        │       ├── 58ab47519297212468320b23b8100fc1b2b96e8d342040806ae509a778a0a07a
        │       │   └── link
        │       ├── 7b880f0c58d0c2a0f79848cdda36be866b83f48a656c7c6f632c7f4d1d7570ff
        │       │   └── link
        │       ├── a9629b29bbee6a3295e42733d471b6b5958c7d7b1fb5cd484ffeeee58deaa01a
        │       │   └── link
        │       ├── c07946da999e3491cdd26b0731ef18829e6685ceff95cb55485b8d8e52ab9076
        │       │   └── link
        │       ├── d862234546d177fc7fe855f260798aa63c9a5e004634a0f01a91a963b8901d9c
        │       │   └── link
        │       └── e479c7e8dd54aec068c1f2434e5adc1bf5a698dfd8663a0e861bb6ec08f13c7c
        │           └── link
        ├── _manifests
        │   ├── revisions
        │   │   └── sha256
        │   │       ├── 25d8449aaee3ae508a1faa391b1a5faca1468a2802e1283caff1748566976cca
        │   │       │   └── link
        │   │       ├── 2a67ce01ed34ac54fcd76582b1c2941da0271d64131b9900ca3982b1c38dbef5
        │   │       │   └── link
        │   │       ├── b29593be8c091e983a93b0d7424bbdccdb4edb927b0658e1318013b9bc9c624a
        │   │       │   └── link
        │   │       └── eee9c02c45b346a4cc99aeada120445660c713d052a7fe4a44474600b2efa0c6
        │   │           └── link
        │   └── tags
        │       └── latest
        │           ├── current
        │           │   └── link
        │           └── index
        │               └── sha256
        │                   └── 2a67ce01ed34ac54fcd76582b1c2941da0271d64131b9900ca3982b1c38dbef5
        │                       └── link
        └── _uploads

90 directories, 44 files

```

In the summry
- all blobs are stored in blobs/sha256 folder
- image metadatas are save in repositories folder


