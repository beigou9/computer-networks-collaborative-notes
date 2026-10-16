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
    速度是160/40 = 4h.$1.8T = 1.8 times 10^12 B $.
    
    - (1)只需要一次,速率是$(1.8 times 10^12)/(4 times 3600) = 1.25 times 10^8 B\/s$.
    - (2)需要去-回-去3次,速率是$(3.6 times 10^12)/(12 times 3600) = 8.33 times 10^7 B\/s$.
    - (3)考虑1.8T送一个来回,速率是$(1.8 times 10^12)/(8 times 3600) = 6.25 times 10^7 B\/s$.
])
#problem[
电视信道宽 6MHz。如果使用 4 级数字信号，每秒可发送多少比特？假设电视信道为无噪声的。
]
#solution[
    
    高带宽高延迟:考虑卫星通信网络,它数据传输速率高,但是需要发到卫星再返回回来,延迟高;
    
    低带宽低延迟:两个相邻机器的串行连接.物理距离很短,因此传播延迟极小;但是带宽不如前者.
]
#problem[
一个类似于图 2-17 的调制解调器星座图有以下几个数据点：(1, 1), (1, -1), (-1, 1) 和 (-1, -1)。一个具备这些参数的调制解调器以 1200 符号/秒的速率能获得多大数据速率 (单位为 b/s)？
#image("/assets/hw2-image-8.png")
]
#solution([
    通过上网搜知道距离差不多是$d = 4000k m$.
    传输时间$t = 4000/(2/3 times 3 times 10^8) = 20 m s >> 20 mu s$,所以不是主要因素.

])

#problem[
    假设在一个 CDMA 系统中，A、B 和 C 同时传输比特 0。它们的码片序列如图 2-22(a) 所示。结果码片序列是什么？#image("/assets/hw2-image-9.png")
]
#solution[
    只考虑传输延迟,是$t = (40000times 2times 2)/(3 times 10^8) = 0.533s $.
]
#problem[
一个 CDMA 接收器接收到了下面的码片：(−1 +1 −3 +1 −1 −3 +1 +1)，假设码片序列如图 2-22(a) 所定义。哪些站传输了数据？每个站发送了什么比特？一个 CDMA 接收器接收到了下面的码片：(−1 +1 −3 +1 −1 −3 +1 +1)，假设码片序列如图 2-22(a) 所定义。哪些站传输了数据？每个站发送了什么比特？
#image("/assets/hw2-image-10.png")
]
#solution([
    速率是$(5times 1500)/(100 times 10^(-6)) = 7.5 times 10^4 B\/ s$.
])
#problem[
   有 3 个包交换网络。每个包含 n 个节点。第一个网络采用星状拓扑结构，有一个中心交换机；第二个网络则采用环形结构；第三个网络则采用全连通结构，每个节点都有一条线路与其他任意一个节点相连。按照跳数，哪个网络是最佳的传输路径？平均传输路径有多少？哪个网络是最差的传输路径？
]
#solution([
    不相同,考虑两个消息#msg1 和 #msg2. 他们对应字节流#texttt[f1],#texttt[f2]. 如果我们发送#texttt[f1f2],接收端无法判断收到的内容是#msg1#msg2 一条信息,还是#msg1 和 #msg2 两条信息.

    而信息流一次发送一条信息,会把上述情况区分开来.
])
#problem[
   比较在一个电路交换网络和一个负载较轻的包交换网络中沿着 k 跳路径发送一个 x 位消息的延迟。假设电路建立时间为 s 秒，每跳的传播延迟为 d 秒，数据包的大小为 p 位，数据传输速率为 b 位/秒。在什么条件下数据包网络的延迟比较小？请解释在什么样的条件下数据包交换网络优于电路交换网络。。]
    #solution[

        前者需要接受端对多个数据包返回值,对小文件来说,会带来额外的流量开销,影响效率;在文件传输正确无错误的情况下,效率会低于后者,且协议更复杂;

        当文件传输出现错误的时候,前者会更快定位到错误出在哪个数据包,而后者必须重新传整个文件,前者错误恢复快,重传丢失的数据包快,.
    ]

    #problem[
      假定在一个数据包交换网络中用户数据长度为x位,将以一系列数据包的形式沿着一条k跳路径传输，每个数据包中包括 p 位数据和 h 位包头，这里 >> p+h。线路的比特率为 b 位/秒，传播延迟忽略不计。什么样的 p 值使得总延迟最小？
    ]
