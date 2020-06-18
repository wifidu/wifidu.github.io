---
tags: [Linux]
date: 2020-06-07 09:31:15
categories:
- Linux
updated:  2020-06-07 09:31:15
---

<!-- vim-markdown-toc Redcarpet -->

* [Shell](#shell)
  * [脚本](#脚本)
  * [Shell　输入/输出重定向](#shell　输入-输出重定向)
* [查询系统负载信息](#查询系统负载信息)
* [Useful commands](#useful-commands)
  * [wc](#wc)
  * [ps](#ps)
  * [top](#top)
  * [free](#free)
  * [df](#df)

<!-- vim-markdown-toc -->
## Shell

### 脚本

```shell
echo -e "OK! \n" # -e 开启转义
```

```shell
echo "数组元素个数为: ${#my_array[*]}"
echo "数组元素个数为: ${#my_array[@]}"
```

- 拼接字符串

```shell
your_name="runoob"
# 使用双引号拼接
greeting="hello, "$your_name" !"
greeting_1="hello, ${your_name} !"
echo $greeting  $greeting_1
# 使用单引号拼接
greeting_2='hello, '$your_name' !'
greeting_3='hello, ${your_name} !'
echo $greeting_2  $greeting_3
```
输出结果为：

```shell
hello, runoob ! hello, runoob !
hello, runoob ! hello, ${your_name} !
```
- 获取字符串长度

```shell
string="abcd"
echo ${#string} #输出 4
```
- 提取子字符串

```shell
以下实例从字符串第 2 个字符开始截取 4 个字符：

string="runoob is a great site"
echo ${string:1:4} # 输出 unoo
注意：第一个字符的索引值为 0。
```

- 查找子字符串

```shell
查找字符 i 或 o 的位置(哪个字母先出现就计算哪个)：

string="runoob is a great site"
echo `expr index "$string" io`  # 输出 4
```
 | 参数处理 | 说明                                                                                                                                                                                    |
 |----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 | $#       | 传递到脚本的参数个数                                                                                                                                                                    |
 | `$0`     | 当前脚本的文件名                                                                                                                                                                        |
 | `$n`     | 传递给脚本或函数的参数。n 是一个数字，表示第几个参数。例如，第一个参数是$1，第二个参数是$2。                                                                                            |
 | $*       | 以一个单字符串显示所有向脚本传递的参数。                                                                                 如"$*"用「"」括起来的情况、以"$1  $2 … $n"的形式输出所有参数。 |
 | $$       | 脚本运行的当前进程ID号                                                                                                                                                                  |
 | $!       | 后台运行的最后一个进程的ID号                                                                                                                                                            |
 | $@       | 与$*相同，但是使用时加引号，并在引号中返回每个参数。如"$@"用「"」括起来的情况、以"$1" "$2" … "$n" 的形式输出所有参数。                                                                  |
 | $-       | 显示Shell使用的当前选项，与set命令功能相同。                                                                                                                                            |
 | $?       | 显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。或返回值。                                                                                                                 |

### [Shell　输入/输出重定向](https://www.runoob.com/linux/linux-shell-io-redirections.html)

| 命令            | 说明                                               |
|-----------------|----------------------------------------------------|
| command > file  | 将输出重定向到 file。                              |
| command < file  | 将输入重定向到 file。                              |
| command >> file | 将输出以追加的方式重定向到 file。                  |
| n > file        | 将文件描述符为 n 的文件重定向到 file。             |
| n >> file       | 将文件描述符为 n 的文件以追加的方式重定向到 file。 |
| n >& m          | 将输出文件 m 和 n 合并。                           |
| n <& m          | 将输入文件 m 和 n 合并。                           |
| << tag          | 将开始标记 tag 和结束标记 tag 之间的内容作为输入。 |

一般情况下，每个 Unix/Linux 命令运行时都会打开三个文件：

- 标准输入文件(stdin)：stdin的文件描述符为0，Unix程序默认从stdin读取数据。
- 标准输出文件(stdout)：stdout 的文件描述符为1，Unix程序默认向stdout输出数据。
- 标准错误文件(stderr)：stderr的文件描述符为2，Unix程序会向stderr流中写入错误信息。

如果希望将 stdout 和 stderr 合并后重定向到 file，可以这样写：

```shell
$ command > file 2>&1

或者

$ command >> file 2>&1
```

如果希望执行某个命令，但又不希望在屏幕上显示输出结果，那么可以将输出重定向到 `/dev/null`：

> /dev/null 是一个特殊的文件，写入到它的内容都会被丢弃；如果尝试从该文件读取内容，那么什么也读不到。但是 /dev/null 文件非常有用，将命令的输出重定向到它，会起到"禁止输出"的效果。

```shell
$ command > /dev/null
```

如果希望屏蔽 stdout 和 stderr，可以这样写：

```shell
$ command > /dev/null 2>&1
```

## 查询系统负载信息

> manjaro linux : `pacman -S net-tools`

`uptime` load average后面的三个数分别是1分钟、5分钟、15分钟的负载情况。

[Linux查看某个端口的连接数](https://www.cnblogs.com/EasonJim/p/8098532.html)

[netstat]( https://www.cnblogs.com/ftl1012/p/netstat.html )

## Useful commands

### [wc](https://www.runoob.com/linux/linux-comm-wc.html)

> wc命令用于计算字数。

**语法**
```
wc [-clw][--help][--version][文件...]
```
- -c或--bytes或--chars 只显示Bytes数。
- -l或--lines 只显示行数。
- -w或--words 只显示字数。
- --help 在线帮助。
- --version 显示版本信息。

**e.g.**
```shell
$ wc testfile           # testfile文件的统计信息  
3 92 598 testfile       # testfile文件的行数为3、单词数92、字节数598
```

### [ps](https://www.runoob.com/linux/linux-comm-ps.html)

**语法**
```
ps [options] [--help]
```

**e.g.**
```shell
# ps -ef //显示所有命令，连带命令行
UID    PID PPID C STIME TTY     TIME CMD
root     1   0 0 10:22 ?    00:00:02 /sbin/init
root     2   0 0 10:22 ?    00:00:00 [kthreadd]
root     3   2 0 10:22 ?    00:00:00 [migration/0]
root     4   2 0 10:22 ?    00:00:00 [ksoftirqd/0]
root     5   2 0 10:22 ?    00:00:00 [watchdog/0]
root     6   2 0 10:22 ?    /usr/lib/NetworkManager
……省略部分结果
root   31302 2095 0 17:42 ?    00:00:00 sshd: root@pts/2 
root   31374 31302 0 17:42 pts/2  00:00:00 -bash
root   31400   1 0 17:46 ?    00:00:00 /usr/bin/python /usr/sbin/aptd
root   31407 31374 0 17:48 pts/2  00:00:00 ps -ef
```

### [top](https://www.runoob.com/w3cnote/linux-common-command-2.html)

**语法**
```
-c 显示完整的进程命令
-s 保密模式
-p <进程号> 指定进程显示
-n <次数>循环显示次数
```

**e.g.**
```shell
top - 14:06:23 up 70 days, 16:44,  2 users,  load average: 1.25, 1.32, 1.35
Tasks: 206 total,   1 running, 205 sleeping,   0 stopped,   0 zombie
Cpu(s):  5.9%us,  3.4%sy,  0.0%ni, 90.4%id,  0.0%wa,  0.0%hi,  0.2%si,  0.0%st
Mem:  32949016k total, 14411180k used, 18537836k free,   169884k buffers
Swap: 32764556k total,        0k used, 32764556k free,  3612636k cached
PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND  
28894 root      22   0 1501m 405m  10m S 52.2  1.3   2534:16 java  
```

前五行是当前系统情况整体的统计信息区。

- 第一行，任务队列信息，同 uptime 命令的执行结果，具体参数说明情况如下：

  14:06:23 — 当前系统时间

  up 70 days, 16:44 — 系统已经运行了70天16小时44分钟（在这期间系统没有重启过的吆！）

  2 users — 当前有2个用户登录系统

  load average: 1.15, 1.42, 1.44 — load average后面的三个数分别是1分钟、5分钟、15分钟的负载情况。

  load average数据是每隔5秒钟检查一次活跃的进程数，然后按特定算法计算出的数值。如果这个数除以逻辑CPU的数量，结果高于5的时候就表明系统在超负荷运转了。
  
  [**load average**](https://blog.csdn.net/ztf312/article/details/80342234)

- 第二行，Tasks — 任务（进程），具体信息说明如下：

  系统现在共有206个进程，其中处于运行中的有1个，205个在休眠（sleep），stoped状态的有0个，zombie状态（僵尸）的有0个。

- 第三行，cpu状态信息，具体属性说明如下：

```
5.9%us — 用户空间占用CPU的百分比。
3.4% sy — 内核空间占用CPU的百分比。
0.0% ni — 改变过优先级的进程占用CPU的百分比
90.4% id — 空闲CPU百分比
0.0% wa — IO等待占用CPU的百分比
0.0% hi — 硬中断（Hardware IRQ）占用CPU的百分比
0.2% si — 软中断（Software Interrupts）占用CPU的百分比
```

备注：在这里CPU的使用比率和windows概念不同，需要理解linux系统用户空间和内核空间的相关知识！

第四行，内存状态，具体信息如下：

```
32949016k total — 物理内存总量（32GB）
14411180k used — 使用中的内存总量（14GB）
18537836k free — 空闲内存总量（18GB）
169884k buffers — 缓存的内存量 （169M）
```

第六行，空行。

第七行以下：各进程（任务）的状态监控，项目列信息说明如下：

```
PID — 进程id
USER — 进程所有者
PR — 进程优先级
NI — nice值。负值表示高优先级，正值表示低优先级
VIRT — 进程使用的虚拟内存总量，单位kb。VIRT=SWAP+RES
RES — 进程使用的、未被换出的物理内存大小，单位kb。RES=CODE+DATA
SHR — 共享内存大小，单位kb
S — 进程状态。D=不可中断的睡眠状态 R=运行 S=睡眠 T=跟踪/停止 Z=僵尸进程
%CPU — 上次更新到现在的CPU时间占用百分比
%MEM — 进程使用的物理内存百分比
TIME+ — 进程使用的CPU时间总计，单位1/100秒
COMMAND — 进程名称（命令名/命令行）
top 交互命令
```

```
h 显示top交互命令帮助信息
c 切换显示命令名称和完整命令行
m 以内存使用率排序
P 根据CPU使用百分比大小进行排序
T 根据时间/累计时间进行排序
W 将当前设置写入~/.toprc文件中
o或者O 改变显示项目的顺序
```

### free

**语法**

```
free [-bkmotV][-s <间隔秒数>]
```

**参数说明：**

    -b 　以Byte为单位显示内存使用情况。
    -k 　以KB为单位显示内存使用情况。
    -m 　以MB为单位显示内存使用情况。
    -h 　以合适的单位显示内存使用情况，最大为三位数，自动计算对应的单位值。单位有：
    -o 　不显示缓冲区调节列。
    -s<间隔秒数> 　持续观察内存使用状况。
    -t 　显示内存总和列。
    -V 　显示版本信息。

### df

> df命令参数功能：检查文件系统的磁盘空间占用情况。可以利用该命令来获取硬盘被占用了多少空间，目前还剩下多少空间等信息。

**语法：**

```
df [-ahikHTm] [目录或文件名]
```

**选项与参数：**

    -a ：列出所有的文件系统，包括系统特有的 /proc 等文件系统；
    -k ：以 KBytes 的容量显示各文件系统；
    -m ：以 MBytes 的容量显示各文件系统；
    -h ：以人们较易阅读的 GBytes, MBytes, KBytes 等格式自行显示；
    -H ：以 M=1000K 取代 M=1024K 的进位方式；
    -T ：显示文件系统类型, 连同该 partition 的 filesystem 名称 (例如 ext3) 也列出；
    -i ：不用硬盘容量，而以 inode 的数量来显示


> weifan
