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


==
#problem[
    你已经在两个中世纪的城堡之间建立了一个通信信道：让一只受训练的渡鸦重复地从发送城堡携带一个卷轴到达160km外的接收城堡。渡鸦飞行的平均速度是40km/h，每次只能携带一个卷轴，每个卷轴包含1.8TB数据。请分别计算在以下3种情况下这一信道的数据速率：①要发送1.8TB数据；②要发送3.6TB数据；③要发送无限的数据流。
]
#problem[
    客户-服务器系统的性能受到两个主要网络特征的严重影响：网络的带宽（即网络每秒可以传输多少位数据）和延迟（即将第一个数据位从客户传送到服务器需要多少秒）。请给出一个网络的例子，它具有高带宽，但也有高延迟；然后再给出另一个网络的例子，它具有低带宽和低延迟。
]
#problem[
    在存储-转发数据包交换系统中，衡量延迟的一个因素是数据包在交换机上存储和转发需要多长时间。假设在一个客户-服务器系统中，客户在纽约而服务器在加州，如果交换时间为20µs，交换时间是否会成为该系统响应延迟的一个主要因素？假设信号在铜线和光纤中的传播速度是真空光速的2/3。
]
#problem[
    一个服务器通过卫星给客户发送数据包。这些数据包在到达目的地以前必须经过一个或多个卫星。这些卫星使用了存储-交换数据包交换模型，交换时间为100µs。如果数据包传输的总距离为29700km，那么，若1%的延迟是由数据包交换引发的，数据包必须经过多少个卫星？
]
#problem[
    一个客户-服务器系统使用了卫星网络，卫星高度为40000km。在响应一个请求时，最佳情形下的延迟是多少？
]
#problem[
    假定两个网络端点的往返时间是100ms，每次往返发送方传输5个数据包。假定数据包的大小为1500B，那么，对于上述往返时间，发送方的传输速率是多少？请以字节每秒（B/s）为单位给出答案。
]
#problem[
    两个网络都可以提供可靠的、面相连接的服务。其中一个提供可靠的字节流，另一个提供可靠的消息流。这两者是否相同？如果你认为这两者相同，为什么要有这样的区别？如果不相同，请给出一个例子说明它们如何不同。
]
#problem[
    当在两台计算机之间传输一个文件时，可以采用两种不同的确认策略。在第一种策略中，该文件被分解成许多个数据包，接收方独立地确认每一个数据包，但没有对整个文件进行确认。在第二种策略中，这些数据包并没有被单独地确认，但是当整个文件到达接收方时会被确认。请讨论这两种方案。]
