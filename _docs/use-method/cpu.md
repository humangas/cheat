# USE Method: CPU

## [use method] CPU ごとの使用率
- `$ mpstat -P ALL 1` の `%idle`（の逆）
- `$ sar -P ALL` の `%idle`

## [use method] システム全体の CPU 使用率
- `$ vmstat 1` の `id`
- `$ sar -u` の `%idle`
- `$ dstat -c` の `idl`

## [use method] プロセスごとの CPU 使用率
- `$ top` の `%CPU`
- `$ htop` の `CPU%`
- `$ ps -o pcpu,pid,stat 1` の `%CPU`

## [use method] カーネルごとの CPU 使用率
- `$ top` `$htop` (K) でトグル、VIRT==0 のとき（ヒューリスティック）

ヒューリスティック:  
> ヒューリスティック（英: heuristic, 独: Heuristik）とは、必ず正しい答えを導けるわけではないが、ある程度のレベルで正解に近い解を得ることができる方法である。 ヒューリスティックスでは、答えの精度が保証されない代わりに、回答に至るまでの時間が少ないという特徴がある。 Wikipedia
 
## [use method] システム全体の CPU 飽和
- `$ vmstat 1` の rCPU 数
    - r欄は、待機しているスレッドと CPU で実行されているスレッドを報告する
- `$ sar -q` の runq-sz>CPU 数
- `$ dstat -p` の run>CPU 数

## [use method] プロセスごとの CPU 飽和
- `/proc/PID/schedstat` の第2フィールド（schedinfo, rundelay)
- `getdelays.c` の CPU（遅延アカウンティングを使っている）
- perf sched latency（スケジュールごとのディレイの平均、最大を表示する）
- 動的トレーシング（e.g. SystemTap schedtimes.stp の queued(us)）

## [use method] CPU のエラーチェック
- perf（LPE）プロセッサ固有エラーイベント（CPC）が利用可能な場合

