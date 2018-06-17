## [vim] タブを開く・移動する
- :tabe 新規タブつくる
- gt(前のタブ）、gT（後ろのタブ）に移動


## [vim] パスリンクをダイレクトに開く
- gx: ブラウザで開く
- gf: vim上でそのファイルパスのファイルをそのまま開く（URLであれば、HTMLソースがそのまま見える）


## [vim] vimでリロード
- :e!


## [vim] ,を改行に置換する
1行のcsvを縦に列挙したいときなどに  
Point: ^M はã<C-v><CR>
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


