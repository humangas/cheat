## [oracle] Oracleでユーザー作成とはじめにつける権限
（そのユーザーでテーブル作ったり色々やるために）  
1) ユーザー（= スキーマ）作成と同時にパスワードいる
```
create user XXX identified by "PASSWORD";
-- テーブルスペースとかも指定したやつ
create user XXX identified by "PASSWORD" default tablespace USER temporary tablespace USERTEMP profile DEFAULT;
```

2) そいつがINSERTとかする時、テーブルスペースに書き込めないとエラーでる
```
alter user XXX quota unlimited on USER;
```

3) 権限つける
```
-- connectが無いとセッションが張れないのでログインできない。箱スキーマで他から利用されるだけあれば不要
grant connect to XXX
```

4) CREATE TABLEなど打てるようになる
```
grant create any table to XXX
```

5) ロールを付与する場合
```
grant ROLE_XXX TO XXX;
```


