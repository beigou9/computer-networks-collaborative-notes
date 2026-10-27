#set page(
    paper: "a4",
    margin: (x: 2.2cm, y: 2cm),
)

#set text(
    font: "New Computer Modern Sans",
    size: 11pt,
)

#set par(
    leading: 0.8em,
    justify: true,
)

#set page(paper: "a4", margin: 3em)
#import "@preview/dvdtyp:1.0.1"
#import "@preview/numbly:0.1.0": numbly
#import "@preview/thmbox:0.3.0": *
#import "@preview/cuti:0.2.1": show-cn-fakebold

#show: show-cn-fakebold
#import "@preview/mitex:0.2.5": *
#set text(font: "Songti SC")
//#show emph: text.with(font: "STKaiti")
//#show smartquote: set text(font: "Libertinus Serif")
#import "@preview/dvdtyp:1.0.1": *
#show math.equation: set text(purple, size: 1em)
#set line(length: 100%, stroke: 0.1pt)
#show: dvdtyp.with(
    title: "hw2",
    author: "易守拙 2024300001103",
)
#let cg = $cal(G)$
#let cv = $cal(V)$
#let al = $chevron.l$
#let ar = $chevron.r$
#let tt(content) = text(font: "JetBrains Mono", content)
#let ui = tt($al"UINT"ar$)
#let di = tt($al"DIGIT"ar$)
#let texttt(body) = text(body, font: "Latin Modern Mono")
#let msg1 = texttt[Hello]
#let msg2 = texttt[World]

=
#problem[
每 1ms 对一条无噪声 3kHz 信道采样一次。最大数据速率是多少？如果信道上有噪声，且信噪比是 30dB，最大数据速率将如何变化？
]
#solution([
  不妨二进制的信道.由奈奎斯特定理,速率是$2 times 3 times 10^3 times log_2 2 = 6 k b p s. $

  有噪声的时候,香农定理得知速率是$ 3 times 10^3 times log_2(1+10^(30/10)) = 3000log_2(1001) b p s$.
])
#problem[
电视信道宽 6MHz。如果使用 4 级数字信号，每秒可发送多少比特？假设电视信道为无噪声的。
]
#solution[
 发送的比特数就是速率的数值.由奈奎斯特定理,答案是$2 times 6 times log_2 4 "Mbps" = 24"Mbps"$.   
]
#problem[
一个类似于图 2-17 的调制解调器星座图有以下几个数据点：(1, 1), (1, -1), (-1, 1) 和 (-1, -1)。一个具备这些参数的调制解调器以 1200 符号/秒的速率能获得多大数据速率 (单位为 b/s)？
#image("/assets/hw2-image-8.png")
]
#solution([
QPSK一个码元可以携带2bit信息.速率是$1200 times 2 = 2400 b\/s$.

])

#problem[
    假设在一个 CDMA 系统中，A、B 和 C 同时传输比特 0。它们的码片序列如图 2-22(a) 所示。结果码片序列是什么？#image("/assets/hw2-image-9.png")
]
#solution[
 0 发送的是反码,所以要发的是$S = overline(A)+overline(B)+overline(C) = (3,1,1,-1,-3,-1,-1,1)$
]
#problem[
一个 CDMA 接收器接收到了下面的码片：(−1 +1 −3 +1 −1 −3 +1 +1)，假设码片序列如图 2-22(a) 所定义。哪些站传输了数据？每个站发送了什么比特？一个 CDMA 接收器接收到了下面的码片：(−1 +1 −3 +1 −1 −3 +1 +1)，假设码片序列如图 2-22(a) 所定义。哪些站传输了数据？每个站发送了什么比特？
#image("/assets/hw2-image-10.png")
]
#solution([
$S = (−1 +1 −3 +1 −1 −3 +1 +1),S dot A = 8\/8=1,S dot B =-8\/8=-1,S dot C =0\/8=0,S dot D =8\/8=1. 
$
所以 A,B, D发送了数据,A, D发了1,C没发,B发了0.
])
#problem[
   有 3 个包交换网络。每个包含 n 个节点。第一个网络采用星状拓扑结构，有一个中心交换机；第二个网络则采用环形结构；第三个网络则采用全连通结构，每个节点都有一条线路与其他任意一个节点相连。按照跳数，哪个网络是最佳的传输路径？平均传输路径有多少？哪个网络是最差的传输路径？
]
#solution([
    - 星形:传输路径都是2跳,平均2跳;
    - 环形:平均$(n(n+1)/2)/((n-1)) = (n^2+n)/(2n-2) = cal(O)(n)$;
    - 全联通:平均1跳.
   所以全联通最优,平均1跳;星形次之;环形最差.
])
#problem[
   比较在一个电路交换网络和一个负载较轻的包交换网络中沿着 k 跳路径发送一个 x 位消息的延迟。假设电路建立时间为 s 秒，每跳的传播延迟为 d 秒，数据包的大小为 p 位，数据传输速率为 b 位/秒。在什么条件下数据包网络的延迟比较小？请解释在什么样的条件下数据包交换网络优于电路交换网络。。]
    #solution[

     电路交换用时:$t_1 =s + x/b+k d$;包交换网络:$t_2 =(x + (k-1)p)/b +k d$.
     $
     t_1>t_2 <==> s>((k-1)p)/b,
     $
     就是满足上述条件的时候才能优于电路交换网络.
    ]

    #problem[
      假定在一个数据包交换网络中用户数据长度为x位,将以一系列数据包的形式沿着一条k跳路径传输，每个数据包中包括 p 位数据和 h 位包头，这里 >> p+h。线路的比特率为 b 位/秒，传播延迟忽略不计。什么样的 p 值使得总延迟最小？
    ]
#solution([
    总延迟是$t = (x/p dot (p+h)+(p+h)dot (k-1))/b$.欲求最小值,需要将分子利用均值不等式.容易知道分子是$
     x+(x h)/p +(k-1)p + h(k-1),
    $
    变量是p,所以$(x h)/p = (k-1)p ==> p = sqrt((x h)/(k-1))$.
])