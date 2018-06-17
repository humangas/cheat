## [aws] IAMユーザー一覧取得する
個人ユーザにu\_から始まるという命名規則をつけた場合
```
$ aws iam list-users | jq -r '.Users[].UserName' | grep -e '^u_.*'
u_xxx_yyy
u_zzz_aaa
u_hogehoge_x
```

人数確認
```
$ aws iam list-users | jq -r '.Users[].UserName' | grep -e '^u_.*' | wc -l
3
```

個人ユーザ以外のユーザ一覧
```
$ aws iam list-users | jq -r '.Users[].UserName' | grep -v '^u_.*'
backup
awsclouduser
ec2_user
```


