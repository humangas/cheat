## [vim] タブを開く・移動する
- :tabe 新規タブつくる
- gt(前のタブ）、gT（後ろのタブ）に移動


## [vim] パスリンクをダイレクトに開く
- gx: ブラウザで開く
- gf: vim上でそのファイルパスのファイルをそのまま開く（URLであれば、HTMLソースがそのまま見える）


## [vim] リロード
- :e!


## [vim] ,を改行に置換する
1行のcsvを縦に列挙したいときなどに  
Point: ^M は、\<C-v\>\<CR\> で出る
```
:%s/,/^M/gc
```


## [vim] vimでdiffする
vim にdiffが出る
```
$ vifdiff file1 file2
```


## [vim] 現在のバッファを2画面でdiffする
```
:windo diffthis
```


## [vim] 空白を除く
```
:v/\S/d
```


## [vim] 開いている（buffer）ファイル一覧
- ls


## [vim] 開いている（buffer）ファイルに移動
- bN, b#, b% とかbでbufferを指定する(lsで見ればキーが分かる）
