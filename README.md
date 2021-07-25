# docker registry storage layout

push image to local registry

```
sudo docker run --rm -d -p 5000:5000 --name registry registry
sudo docker pull busybox
sudo docker tag busybox localhost:5000/busybox
sudo docker push localhost:5000/busybox

```


login registry. Images' content are stored in `/var/lib/registry`

```
sudo docker exec -it registry /bin/sh

/var/lib/registry # tree
.
└── docker
    └── registry
        └── v2
            ├── blobs
            │   └── sha256
            │       ├── 69
            │       │   └── 69593048aa3acfee0f75f20b77acb549de2472063053f6730c4091b53f2dfb02
            │       │       └── data
            │       ├── b7
            │       │   └── b71f96345d44b237decc0c2d6c2f9ad0d17fde83dad7579608f1f0764d9686f2
            │       │       └── data
            │       └── dc
            │           └── dca71257cd2e72840a21f0323234bb2e33fea6d949fa0f21c5102146f583486b
            │               └── data
            └── repositories
                └── busybox
                    ├── _layers
                    │   └── sha256
                    │       ├── 69593048aa3acfee0f75f20b77acb549de2472063053f6730c4091b53f2dfb02
                    │       │   └── link
                    │       └── b71f96345d44b237decc0c2d6c2f9ad0d17fde83dad7579608f1f0764d9686f2
                    │           └── link
                    ├── _manifests
                    │   ├── revisions
                    │   │   └── sha256
                    │   │       └── dca71257cd2e72840a21f0323234bb2e33fea6d949fa0f21c5102146f583486b
                    │   │           └── link
                    │   └── tags
                    │       └── latest
                    │           ├── current
                    │           │   └── link
                    │           └── index
                    │               └── sha256
                    │                   └── dca71257cd2e72840a21f0323234bb2e33fea6d949fa0f21c5102146f583486b
                    │                       └── link
                    └── _uploads

28 directories, 8 files

```

download buysbox image through skopeo 

```
sudo skopeo copy docker://busybox dir:busybox

leo@leo-vm:~/work/lab$ tree
.
├── busybox
│   ├── 69593048aa3acfee0f75f20b77acb549de2472063053f6730c4091b53f2dfb02
│   ├── b71f96345d44b237decc0c2d6c2f9ad0d17fde83dad7579608f1f0764d9686f2
│   ├── manifest.json
│   └── version
└── README.md

1 directory, 5 files
leo@leo-vm:~/work/lab$ sha256sum busybox/manifest.json
dca71257cd2e72840a21f0323234bb2e33fea6d949fa0f21c5102146f583486b  busybox/manifest.json
leo@leo-vm:~/work/lab$

```


push another verison busybox(busybox:1.29.2) `sudo docker push localhost:5000/busybox:1.29.2`


```

.
└── registry
    └── v2
        ├── blobs
        │   └── sha256
        │       ├── 5e
        │       │   └── 5e8e0509e829bb8f990249135a36e81a3ecbe94294e7a185cc14616e5fad96bd
        │       │       └── data
        │       ├── 69
        │       │   └── 69593048aa3acfee0f75f20b77acb549de2472063053f6730c4091b53f2dfb02
        │       │       └── data
        │       ├── 8c
        │       │   └── 8c5a7da1afbc602695fcb2cd6445743cec5ff32053ea589ea9bd8773b7068185
        │       │       └── data
        │       ├── b7
        │       │   └── b71f96345d44b237decc0c2d6c2f9ad0d17fde83dad7579608f1f0764d9686f2
        │       │       └── data
        │       ├── dc
        │       │   └── dca71257cd2e72840a21f0323234bb2e33fea6d949fa0f21c5102146f583486b
        │       │       └── data
        │       └── e1
        │           └── e1ddd7948a1c31709a23cc5b7dfe96e55fc364f90e1cebcde0773a1b5a30dcda
        │               └── data
        └── repositories
            └── busybox
                ├── _layers
                │   └── sha256
                │       ├── 69593048aa3acfee0f75f20b77acb549de2472063053f6730c4091b53f2dfb02
                │       │   └── link
                │       ├── 8c5a7da1afbc602695fcb2cd6445743cec5ff32053ea589ea9bd8773b7068185
                │       │   └── link
                │       ├── b71f96345d44b237decc0c2d6c2f9ad0d17fde83dad7579608f1f0764d9686f2
                │       │   └── link
                │       └── e1ddd7948a1c31709a23cc5b7dfe96e55fc364f90e1cebcde0773a1b5a30dcda
                │           └── link
                ├── _manifests
                │   ├── revisions
                │   │   └── sha256
                │   │       ├── 5e8e0509e829bb8f990249135a36e81a3ecbe94294e7a185cc14616e5fad96bd
                │   │       │   └── link
                │   │       └── dca71257cd2e72840a21f0323234bb2e33fea6d949fa0f21c5102146f583486b
                │   │           └── link
                │   └── tags
                │       ├── 1.29.2
                │       │   ├── current
                │       │   │   └── link
                │       │   └── index
                │       │       └── sha256
                │       │           └── 5e8e0509e829bb8f990249135a36e81a3ecbe94294e7a185cc14616e5fad96bd
                │       │               └── link
                │       └── latest
                │           ├── current
                │           │   └── link
                │           └── index
                │               └── sha256
                │                   └── dca71257cd2e72840a21f0323234bb2e33fea6d949fa0f21c5102146f583486b
                │                       └── link
                └── _uploads

41 directories, 16 files

```

push apline

```
/var/lib/registry/docker # tree
.
└── registry
    └── v2
        ├── blobs
        │   └── sha256
        │       ├── 18
        │       │   └── 188c0c94c7c576fff0792aca7ec73d67a2f7f4cb3a6e53a84559337260b36964
        │       │       └── data
        │       ├── 5e
        │       │   └── 5e8e0509e829bb8f990249135a36e81a3ecbe94294e7a185cc14616e5fad96bd
        │       │       └── data
        │       ├── 69
        │       │   └── 69593048aa3acfee0f75f20b77acb549de2472063053f6730c4091b53f2dfb02
        │       │       └── data
        │       ├── 8c
        │       │   └── 8c5a7da1afbc602695fcb2cd6445743cec5ff32053ea589ea9bd8773b7068185
        │       │       └── data
        │       ├── b7
        │       │   └── b71f96345d44b237decc0c2d6c2f9ad0d17fde83dad7579608f1f0764d9686f2
        │       │       └── data
        │       ├── d6
        │       │   └── d6e46aa2470df1d32034c6707c8041158b652f38d2a9ae3d7ad7e7532d22ebe0
        │       │       └── data
        │       ├── d7
        │       │   └── d7342993700f8cd7aba8496c2d0e57be0666e80b4c441925fc6f9361fa81d10e
        │       │       └── data
        │       ├── dc
        │       │   └── dca71257cd2e72840a21f0323234bb2e33fea6d949fa0f21c5102146f583486b
        │       │       └── data
        │       └── e1
        │           └── e1ddd7948a1c31709a23cc5b7dfe96e55fc364f90e1cebcde0773a1b5a30dcda
        │               └── data
        └── repositories
            ├── alpine
            │   ├── _layers
            │   │   └── sha256
            │   │       ├── 188c0c94c7c576fff0792aca7ec73d67a2f7f4cb3a6e53a84559337260b36964
            │   │       │   └── link
            │   │       └── d6e46aa2470df1d32034c6707c8041158b652f38d2a9ae3d7ad7e7532d22ebe0
            │   │           └── link
            │   ├── _manifests
            │   │   ├── revisions
            │   │   │   └── sha256
            │   │   │       └── d7342993700f8cd7aba8496c2d0e57be0666e80b4c441925fc6f9361fa81d10e
            │   │   │           └── link
            │   │   └── tags
            │   │       └── latest
            │   │           ├── current
            │   │           │   └── link
            │   │           └── index
            │   │               └── sha256
            │   │                   └── d7342993700f8cd7aba8496c2d0e57be0666e80b4c441925fc6f9361fa81d10e
            │   │                       └── link
            │   └── _uploads
            └── busybox
                ├── _layers
                │   └── sha256
                │       ├── 69593048aa3acfee0f75f20b77acb549de2472063053f6730c4091b53f2dfb02
                │       │   └── link
                │       ├── 8c5a7da1afbc602695fcb2cd6445743cec5ff32053ea589ea9bd8773b7068185
                │       │   └── link
                │       ├── b71f96345d44b237decc0c2d6c2f9ad0d17fde83dad7579608f1f0764d9686f2
                │       │   └── link
                │       └── e1ddd7948a1c31709a23cc5b7dfe96e55fc364f90e1cebcde0773a1b5a30dcda
                │           └── link
                ├── _manifests
                │   ├── revisions
                │   │   └── sha256
                │   │       ├── 5e8e0509e829bb8f990249135a36e81a3ecbe94294e7a185cc14616e5fad96bd
                │   │       │   └── link
                │   │       └── dca71257cd2e72840a21f0323234bb2e33fea6d949fa0f21c5102146f583486b
                │   │           └── link
                │   └── tags
                │       ├── 1.29.2
                │       │   ├── current
                │       │   │   └── link
                │       │   └── index
                │       │       └── sha256
                │       │           └── 5e8e0509e829bb8f990249135a36e81a3ecbe94294e7a185cc14616e5fad96bd
                │       │               └── link
                │       └── latest
                │           ├── current
                │           │   └── link
                │           └── index
                │               └── sha256
                │                   └── dca71257cd2e72840a21f0323234bb2e33fea6d949fa0f21c5102146f583486b
                │                       └── link
                └── _uploads

63 directories, 24 files

```
