## [less] lessでよく使う操作
開く前に:
- less +F file: = tail -f file  <C-c>で通常lessモードに

開いた後に:
- <S-f>: tail -f モード
- <S-=>: 情報表示（ライン、ファイルサイズ）
  - e.g. log/xxx.log lines 1-11/11 byte 1054/1054 (END)   (press RETURN)
- !<CR>: コマンドモード（exitにlessに戻る）
- !{command}: コマンド実行
- v: そのファイルをvimで開く
- -N: 行番号表示（もう一回やると戻る）
- -M: 詳細表示（もう一回やると戻る）
- &{word} {word}でgrepした結果だけフィルタリング（&<CR>で元通り）
- :e {file} 新規にファイルを開く（ファイルを指定しない場合は現在のファイルを読み直す）
- :n 次のファイル
- :p 前のファイル
- :x 先頭のファイル

