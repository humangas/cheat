## [du] デカ目のファイルの合計を降順ソートして表示したい
```
$ sudo du -sh /home/persons/* | grep G | sort -nr
3.9G    /home/persons/honda_atsuhiro
2.6G    /home/persons/kagawa_shinji
2.3G    /home/persons/nagatomo_yuuto
1.6G    /home/persons/masa_saito
1.1G    /home/persons/hiro_saito
```


## [du] ディレクトリ単位の容量 主要オプションが知りたい
- s: サマリ（合計）
- a: ファイルも出す
- b: デフォルトのKbyteではなく、byteで出す
- k: Kbyte, -m: Mbyte
- h: äººに読みやすい単位で出す
- c: 最後に合計がでる


## [du] ファイルサイズランキング TOP10
2>/dev/null でエラーは無視する
```
$ du -s /* 2>/dev/null | sort -nr | head -10

11822140 /var
8238456 /home
1920804 /usr
・・・
```


## [du] 負荷をかけずにサイズを調べる
ioniceとnice（= プロセスの実行優先度）を下げて（例は最低の19）にしてduする。  
duは大量ファイルにかけると負荷になるので、duする場所によっては負荷をコントロールする。
```
$ ionice -c2 -n7 nice -n19 du -scm *
```

nice: 数値が小さいほうがプロセスの実行優先度が高い
- root: 19 〜 -20
- user: 19 〜 0

ionice: プロセスのディスクI/O優先度を指定する(niceのI/O版）
- c[1-3]: 1:Real Time（最高）, 2:Best Effort（デフォルト）, 3:Idle（最低）
- n[0-7]: niceと同じで数値が小さいほうが優先度が高い(7 〜 0)

ただし、ionice は以下の2条件を満たせないと効かないので注意
- I/O SchedulerがCFQ
- 特定のI/O: キャッシュされていないファイルへのRead, 特殊フラグの立ったWrite

- see: [そのionice、ほんとうに効いてますか？](https://www.slideshare.net/narimichitakamura/ionice)

