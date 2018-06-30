## [git] gitで最初にやる基本設定
ユーザ名・メールアドレス（pushするときに必須）
```
$ git config --global user.name XXX
$ git config --global user.email XXX@XXX.com
```

Macの場合で、パスワードでpushする（sshの鍵でpushしない）場合、osxkeychainに保存する
```
$ git config --global credential.helper osxkeychain
```

ssh(gitプロトコル)使えなくてhttps縛りの場合で、さらにオレオレ証明書の場合
```
$ git config --global http.sslverify false 
```


## [git] addしたファイルのdiffを確認する(commit前）
```
$ git diff --cached
$ git diff --cached <ファイルパス>
```


## [git] HEADにマージしたブランチを削除したい
```
$ git branch --delete foo
```


## [git] masterの内容を引き継がずにブランチを作成したい(ドキュメント管理専用ブランチ作成の場合など)
通常のブランチ作成 （例えば git checkout -b gh-pages） では、作業ディレクトリの内容が全て引き継がれてしまう。
ドキュメント管理専用ブランチを作成したいという要件の場合、masterの内容は不要。そういう時は以下の手順でできる。

e.g. staging環境のドキュメント公開用ブランチ(staging)を作成する
```
$ git clone https://github.com/humangas/x_document.git
$ (master) cd x_document
$ (master) git symbolic-ref HEAD refs/heads/staging
$ (staging) rm .git/index
$ (staging) git clean -fdx
$ (staging) echo "Hello" > index.md
$ (staging) git add -A
$ (staging) git commit -m 'first commit'
$ (staging) git push origin staging
```


## [git] まだリモートにpushしてないローカルコミットを確認する
```
$ git log origin/master..master
```

ブランチを指定する場合
```
$ git log origin/master..<branch>
```

（逆に）リモートのorigin/masterにのみ存在するコミットを見たい場合
```
git log master..origin/master
```

ローカルだけもリモートだけも合わせて両方のコミットログを表示(「...」が３つになっている)
```
$ git log origin/master...master
```

--left-right オプションを付けるとどのコミットがどっちのブランチに存在しているかを確認できる
```
$ git log --left-right master...origin/master
```


## [git] コミットしたファイルのdiffを見たい
```
$ git log
# 目的のcommit idをコピー
$ git show <commit id>
```


## [git] ブランチを強制削除したい
マージしたかどうかを問わずに削除する
```
$ git branch -D foo
```


## [git] リモートブランチを削除したい
コロンを前につける（ローカルは残るので、git branch -D foo で削除）
```
$ git push origin :new-feature
To https://source.developers.google.com/p/projectid/r/default
 - [deleted]         new-feature
```


## [git] すべての（ローカル・リモート） ブランチを表示する
```
$ git branch --all
master
foo
bar
origin/HEAD -> origin/master
origin/foo
origin/bar
```

リモートだけ参照する場合は、`--remote`


## [git] 特定のコミットだけ戻したい
```
$ git log <ファイルパス>
$ git checkout ad97721dbcf4e3d7f68305c714d673aaafc32637 <ファイルパス>
```


## [git] コミットをやり直したい（あの時に戻りたい）: reflogで確認してからそこにresetする
```
$ git reflog
3e9e73e HEAD@{1}: reset: moving to HEAD@{6}
8f19cec (HEAD -> master, origin/master, origin/canary, canary) HEAD@{2}: merge canary: Fast-forward
787e3f4 HEAD@{3}: reset: moving to HEAD^

$ git reset --hard HEAD@{2}
```
reflog: 参照ログ、過去のあらゆるコミット履歴をみることができ、上記のãうに指定すればそこまで戻ることができる  
ユースケース: ある時点からのコミットを全部やり直したいとき


## [git] 特定のコミットだけをやり直したい（取り消し線のイメージ）: revert 
```
$ git revert <commit id>
```
ユースケース: バグの原因があるコミットに起因しており、それだけ除きたいとき  
元に戻すが、元に戻したことを新たなコミットにする（すでに公開されたコミットログをしれっとなくすではなく、理由があって元に戻したと分かるようにする）


## [git] 特定のバージョン（タグ）に切り替えたい
branchを作らずに、タグの参照のみのチェックアウトすることができる
```
$ git pull origin master
$ git pull --tags
$ git tag
$ git checkout refs/tags/1.3.1
$ git branch
refs/tags/{{tagname}}
```

## [git] ローカルの変更を一時退避して、先にpullを取り込んでから追加したい
こんなシチュエーションの時に...

1. ローカルであるファイルを編集した
1. pushしようかと思ったけど、先に最新版を取り込もうと思い返す 
1. git pull したら、そのファイルに変更が入っていた
1. ローカルの変更を一時退避してpull後に追加したい
1. git stash して退避してから、pullして最新化
```
$ git stash
$ git pull
```
6. apply したいstash番号を確認してからapplyする
```
git stash list 
git apply stash@{N}
```
7. 中身確認して問題なければcommitし、不要になったstashは削除する
```
git commit -m 'hogehoge'
git stash drop N
```
