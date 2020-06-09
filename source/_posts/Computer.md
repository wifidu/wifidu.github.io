---
tags: [Computer]
date: 2020-06-07 09:29:48
categories:
- Computer
updated:  2020-06-07 09:29:48
---

# 面试题问题笔记

<!-- vim-markdown-toc Redcarpet -->

* [堆栈的区别](#堆栈的区别)
* [进程和线程](#进程和线程)
    * [什么是进程](#什么是进程)
    * [什么是线程](#什么是线程)
    * [区别](#区别)
* [互联网协议](#互联网协议)
  * [实体层](#实体层)
  * [链接层](#链接层)
    * [以太网协议](#以太网协议)
    * [MAC地址](#mac地址)
    * [广播](#广播)
  * [网络层](#网络层)
    * [IP地址](#ip地址)
    * [IP数据包](#ip数据包)
    * [ARP协议](#arp协议)
  * [传输层](#传输层)
    * [UDP协议](#udp协议)
    * [TCP协议](#tcp协议)
  * [应用层](#应用层)

<!-- vim-markdown-toc -->
## [堆栈的区别](https://www.php.cn/faq/416802.html)

1. 栈内存存储的是局部变量而堆内存存储的是实体；

2. 栈内存的更新速度要快于堆内存，因为局部变量的生命周期很短；

3. 栈内存存放的变量生命周期一旦结束就会被释放，而堆内存存放的实体会被垃圾回收机制不定时的回收。

## [进程和线程](https://www.cnblogs.com/aaronthon/p/9824396.html)

#### 什么是进程

- 进程是资源(CPU、内存等)分配的基本单位，它是程序执行时的一个实例。
- 程序运行时系统就会创建一个进程，并为它分配资源，然后把该进程放入进程就绪队列。
- 进程调度器选中它的时候就会为它分配CPU时间，程序开始真正运行。

#### 什么是线程

- 线程是程序执行时的最小单位，它是进程的一个执行流，是CPU调度和分配的基本单位。
- 一个进程可以由很多个线程组成，线程间共享进程的所有资源，每个线程有自己的堆栈和局部变量。
- 线程由CPU独立调度执行，在多CPU环境下就允许多个线程同时运行。同样多线程也可以实现并发操作，每个请求分配一个线程来处理。

#### 区别

- 地址空间和其他资源：进程间相互独立，同一进程的各线程间共享。某进程内的县城在其他进程内不可见。
- 通信：进程间通信IPC(管道，信号量，共享内存，消息队列)，线程间可以直接单独写进程数据段(如全局变量)来进程通信。
- 线程上下文切换比进程上下文切换快的多。
- 在多线程OS中，进程不是一个可执行的实体。
- [more](https://blog.csdn.net/wsq119/article/details/82154305)

## 互联网协议

> 互联网模型有五层：`应用层`、`传输层`、`网络层`、`链接层`、`实体层`

### 实体层

就是把电脑连接起来的物理手段。它主要规定了网络的一些电气特性，作用是负责传送0和1的电信号。

### 链接层

单纯的0和1没有任何意义，必须规定解读方式：多少个电信号算一组？每个信号位有何意义？(所以**以太网**协议出现了)

这就是"链接层"的功能，它在"实体层"的上方，确定了0和1的分组方式。

#### 以太网协议

以太网规定，一组电信号构成一个数据包，叫做"帧"（Frame）。每一帧分成两个部分：标头（Head）和数据（Data）。

#### MAC地址

以太网规定，连入网络的所有设备，都必须具有"网卡"接口。数据包必须是从一块网卡，传送到另一块网卡。网卡的地址，就是数据包的发送地址和接收地址，这叫做MAC地址。

每块网卡出厂的时候，都有一个全世界独一无二的MAC地址，长度是48个二进制位，通常用12个十六进制数表示。

#### 广播

首先，一块网卡怎么会知道另一块网卡的MAC地址？

回答是有一种`ARP协议`，可以解决这个问题。这个留到后面介绍，这里只需要知道，以太网数据包必须知道接收方的MAC地址，然后才能发送。

其次，就算有了MAC地址，系统怎样才能把数据包准确送到接收方？

回答是以太网采用了一种很"原始"的方式，它不是把数据包准确送到接收方，而是向本网络内所有计算机发送，让每台计算机自己判断，是否为接收方。

------------------------------------------------
有了数据包的定义、网卡的MAC地址、广播的发送方式，"链接层"就可以在多台计算机之间传送数据了。

### 网络层

互联网是无数子网络共同组成的一个巨型网络，很像想象上海和洛杉矶的电脑会在同一个子网络，这几乎是不可能的。

这就导致了"网络层"的诞生。它的作用是引进一套新的地址，使得我们能够区分不同的计算机是否属于同一个子网络。这套地址就叫做"**网络地址**"，简称"网址"。

#### IP地址

规定**网络地址**的协议，叫做IP协议。它所定义的地址，就被称为IP地址。

目前，广泛采用的是IP协议第四版，简称IPv4。这个版本规定，网络地址由32个二进制位组成。

互联网上的每一台计算机，都会分配到一个IP地址。这个地址分成两个部分，前一部分代表网络，后一部分代表主机。比如，IP地址172.16.254.1，这是一个32位的地址，假定它的网络部分是前24位（172.16.254），那么主机部分就是后8位（最后的那个1）。处于同一个子网络的电脑，它们IP地址的网络部分必定是相同的，也就是说172.16.254.2应该与172.16.254.1处在同一个子网络。

知道"子网掩码"，我们就能判断，任意两个IP地址是否处在同一个子网络。方法是将两个IP地址与子网掩码分别进行AND运算（两个数位都为1，运算结果为1，否则为0），然后比较结果是否相同，如果是的话，就表明它们在同一个子网络中，否则就不是。

> IP协议的作用主要有两个，一个是为每一台计算机分配IP地址，另一个是确定哪些地址在同一个子网络。

#### IP数据包

根据IP协议发送的数据，就叫做IP数据包。不难想象，其中必定包括IP地址信息。

我们可以把IP数据包直接放进以太网数据包的"数据"部分，因此完全不用修改以太网的规格。这就是互联网分层结构的好处：上层的变动完全不涉及下层的结构。

具体来说，IP数据包也分为"标头"和"数据"两个部分。

#### ARP协议

如果两台主机在同一个子网络，那么我们可以用ARP协议，得到对方的MAC地址。ARP协议也是发出一个数据包（包含在以太网数据包中），其中包含它所要查询主机的IP地址，在对方的MAC地址这一栏，填的是FF:FF:FF:FF:FF:FF，表示这是一个"广播"地址。它所在子网络的每一台主机，都会收到这个数据包，从中取出IP地址，与自身的IP地址进行比较。如果两者相同，都做出回复，向对方报告自己的MAC地址，否则就丢弃这个包。

总之，有了ARP协议之后，我们就可以得到同一个子网络内的主机MAC地址，可以把数据包发送到任意一台主机之上了。

### 传输层

有了MAC地址和IP地址，我们已经可以在互联网上任意两台主机上建立通信。

接下来的问题是，同一台主机上有许多程序都需要用到网络，比如，你一边浏览网页，一边与朋友在线聊天。当一个数据包从互联网上发来的时候，你怎么知道，它是表示网页的内容，还是表示在线聊天的内容？

"端口"是0到65535之间的一个整数，正好16个二进制位。0到1023的端口被系统占用，用户只能选用大于1023的端口。不管是浏览网页还是在线聊天，应用程序会随机选用一个端口，然后与服务器的相应端口联系。

**"传输层"的功能，就是建立"端口到端口"的通信。相比之下，"网络层"的功能是建立"主机到主机"的通信。只要确定主机和端口，我们就能实现程序之间的交流。因此，Unix系统就把主机+端口，叫做"套接字"（socket）。有了它，就可以进行网络应用程序开发了。**

#### UDP协议

现在，我们必须在数据包中加入端口信息，这就需要新的协议。最简单的实现叫做UDP协议，它的格式几乎就是在数据前面，加上端口号。

UDP数据包，也是由"标头"和"数据"两部分组成。

"标头"部分主要定义了发出端口和接收端口，"数据"部分就是具体的内容。然后，把整个UDP数据包放入IP数据包的"数据"部分，而前面说过，IP数据包又是放在以太网数据包之中的

#### TCP协议

UDP协议的优点是比较简单，容易实现，但是缺点是可靠性较差，一旦数据包发出，无法知道对方是否收到。

为了解决这个问题，提高网络可靠性，TCP协议就诞生了。这个协议非常复杂，但可以近似认为，它就是有确认机制的UDP协议，每发出一个数据包都要求确认。如果有一个数据包遗失，就收不到确认，发出方就知道有必要重发这个数据包了。

因此，TCP协议能够确保数据不会遗失。它的缺点是过程复杂、实现困难、消耗较多的资源。

TCP数据包和UDP数据包一样，都是内嵌在IP数据包的"数据"部分。TCP数据包没有长度限制，理论上可以无限长，但是为了保证网络的效率，通常TCP数据包的长度不会超过IP数据包的长度，以确保单个TCP数据包不必再分割。

### 应用层

应用程序收到"传输层"的数据，接下来就要进行解读。由于互联网是开放架构，数据来源五花八门，必须事先规定好格式，否则根本无法解读。

> "应用层"的作用，就是规定应用程序的数据格式。

举例来说，TCP协议可以为各种各样的程序传递数据，比如Email、WWW、FTP等等。那么，必须有不同协议规定电子邮件、网页、FTP数据的格式，这些应用程序协议就构成了"应用层"。