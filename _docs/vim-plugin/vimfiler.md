# vimfiler
[Shougo/vimfiler](https://github.com/Shougo/vimfiler.vim)


## [vimfiler] helpを開く
vimfiler 画面を開いた状態で g?  
操作キーは、ここで確認すればいい


## [vimfiler] $HOMEに移動
- ~


## [vimfiler] 隠しファイル(.xxxx)を表示する
- .


## [vimfiler] vimエクスプローラーをvimfilerにする
```
let g:vimfiler_as_default_explorer = 1
```
`:e .` した時、vimfiler が開く


## [vimfiler] カレントディレクトリを開く（cdする）
```
let g:vimfiler_enable_auto_cd = 1
```

## [vimfiler] オレオレキー設定
```
nnoremap <silent> <Space>e :<C-u>VimFilerBufferDir<CR>
nnoremap <silent> <Space>E :<C-u>VimFilerBufferDir<Space>-explorer<Space>-direction=rightbelow<CR>
```
- Space + e: エクスプローラーが開く
- Space + Shift + e: 右側にエクスプローラーが開く（ほぼ使わない）
