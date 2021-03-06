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

vim で開いているファイルとの diff を表示する
```
# 縦に開く
:diffsplit <file>

# 横に開く
:vertical diffsplit <file>
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
- :ls


## [vim] 開いている（buffer）ファイルに移動
- :bN, b#, b% とかbでbufferを指定する(lsで見ればキーが分かる）


## [vim] 画面を横に分割する
- :vs


## [vim] 画面を縦に分割する
- :sp


## [vim] 分割したウィンドウを最大化する
- \<C-w\>, |

元に戻す場合:
- \<C-w\>, =


## [vim] ターミナル（teminal）モードを使う
- :terminal で、画面が分割されターミナルが開く（インサートモードで開く）
- ウィンドウ移動: 通常のウィンドウ操作同様で `<C-w> <C-w>`
- コマンドモード: `<C-w>:`
- ノーマルモード: `<C-\><C-n>` 
- ノーマルモードから再びターミナルを使いたい: i でインサートモード = ターミナル通常利用モード
- ペースト: `<C-w>""` （"" = 無名レジスタ, a レジスタなら `<C-w>"a`）


## [vim] 関数移動
- `[[` 前の関数に移動
- `]]` 次の関数に移動


## [vim] 表示画面内で上、中、下に移動
- H 画面最上部
- M 画面中央
- L 画面最下部
- `zz`: 今いる行を中央にする
- `z<CR>`: 今いる行を先頭にする


## [vim] ジャンプリストに移動
- `<C-o>` 戻る
- `<C-i>` 進む 


## [vim] 段落移動
- `{` 上
- `}` 下


## [vim] ファイルの割合（%）指定して移動
- N% e.g. 30% で30%のところに移動


## [vim] ファイル最下部でインサートモード
- gi


## [vim] さっきいたところと今のところに行ったり来たり
- `''`
 

## [vim] 選択範囲を折りたたむ
- 選択範囲を折りたたむ: ヴィジュアルモードで、zf
- 折りたたみ解除: ヴィジュアルモードで、zd


