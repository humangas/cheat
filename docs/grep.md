## [grep] grepした結果を1ファイルにまとめたい
/var/log/messages\* に出力されているエラーを一つのファイルにまとめる
```
$ cd /var/log
$ for v in `ls messages*`; do echo $v; sudo egrep '\serr|\scrit|\semerg' $v >> ~/messages.err; done
```


