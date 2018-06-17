## [shell] あるディレクトリ配下のファイル数をカウントする 
```
$ for l in `ls $PWD`; do echo -n "$l :"; ls -l $l/logs/ | wc -l; done
d361249ed354 :35
d4e89bf5cc4c :12673
bbef53f8b3bb :3

$ tree
.
├── d361249ed354
│   └── logs
├── d4e89bf5cc4c
│   └── logs
└── bbef53f8b3bb
    └── logs
```



