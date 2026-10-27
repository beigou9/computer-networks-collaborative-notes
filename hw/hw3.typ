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
在什么样的环境下，一个开环协议(比如海明码)有可能比本章讨论的反馈类协议更加适合？
]
#solution([
  在下列情况下更合适:
  - 接收方无法返回确认或者确认成本很大(例如,卫星传输,由于距离很远,返回确认信息延迟高且成本较大);
  - 要求即时传播,如果经过反馈协议后,信息就过时了,那么必须要开环协议.
])
#problem[
使用本章介绍的标准CRC方法传输比特流10011101。生成多项式为x3+1。实际传输的位串是什么？假设左边开始的第3比特在传输过程中反转了，请说明这个错误可以在接收方检测出来。给出一个该比特流错误的实例，使得接收方无法检测出该错误。
]
#solution[
$G=1001,D=10011101.$计算模2除法:

#import "@preview/cetz:0.3.4": canvas, draw

#set text(font: ("DejaVu Sans Mono", "Courier New"), size: 13pt)

// rows:除法過程每一行 (位串, 起始列號),列號以被除數第一位為 0
// 偶數行(第 0、2、4…行)= 減去的除數,畫底線
// 奇數行 = XOR 結果,其中「落下來」的位自動畫紅箭頭
#let crc-division(dividend, divisor, quotient, data-len, rows) = canvas(length: 0.55cm, {
  import draw: *
  let dy = 1.2
  let green = rgb("#22aa44")
  let n = dividend.len()

  // 商:右端對齊被除數
  for (i, ch) in quotient.clusters().enumerate() {
    content((n - quotient.len() + i, dy), ch)
  }
  // 除號框線
  line((-0.6, -0.5), (-0.6, dy * 0.55), (n - 0.4, dy * 0.55), stroke: 1.2pt + navy)

  // 除數 G
  for (i, ch) in divisor.clusters().enumerate() {
    content((i - divisor.len() - 1, 0), ch)
  }
  content((-divisor.len() - 1.6, 0), [$G ->$], anchor: "east")

  // 被除數(補上的 0 用綠色)
  for (i, ch) in dividend.clusters().enumerate() {
    content((i, 0), text(fill: if i >= data-len { green } else { black }, ch))
  }
  content((n - 0.2, 0), [$<- 2^n D$], anchor: "west")

  // 除法過程
  let prev-end = divisor.len() - 1
  for (k, (s, col)) in rows.enumerate() {
    let y = -(k + 1) * dy
    let is-sub = calc.even(k)
    let end = col + s.len() - 1
    for (i, ch) in s.clusters().enumerate() {
      let c = col + i
      let brought = not is-sub and c > prev-end   // 從上面落下來的位
      content((c, y), text(fill: if brought and c >= data-len { green } else { black }, ch))
      if brought {
        line((c, -0.45), (c, y + 0.45), stroke: 0.8pt + red,
             mark: (end: ">", fill: red))
      }
    }
    if is-sub {
      line((col - 0.5, y - 0.55), (end + 0.5, y - 0.55), stroke: 1.2pt + navy)
    }
    if k == rows.len() - 1 {
      content((end + 0.8, y), [$<- R$], anchor: "west")
    }
    prev-end = end
  }
})

#crc-division(
  "10011101000",  // 2^n D(原數據 + 5 個 0)
  "1001",           // G
  "10001100",       // 商
  10,                 // 原數據長度(之後的位是補的 0)
  (
    ("1001", 0), ("1101", 4),
    ("1001", 4), ("1000", 5),
    ("1001", 5), ("100", 8),
   
    
  ),
)
#set text(font: ("New Computer Modern Sans","STKaiTi"))
所以$R = 100$,传输10011101100.

如果说第3bit错了,就是10111101100,也就是$hat(D) = D + x^8$,注意到$x^3 equiv -1 mod(x^3+1)$,$ x^8 equiv x^6 dot x^2 equiv x^2 mod(x^3+1) equiv.not 0 mod (x^3+1) $,所以能检测到错误.

无法检测的例子:$hat(D) = D + x^5(x^3+1)$就检测不到了,这里对应着10111001100.就是反转3bit和6bit.
]
#problem[
考虑一个具有4kb/s速率和20ms传输延迟的信道。帧的大小在什么范围内，停-等式协议才能获得至少50%的效率？
]
#solution([
效率是$(t)/(t+2f) gt.eq.slant 50%
$,也就是$t>=2f$,其中f传输延迟,t是传输时间.
计算得到$t>=40m s$,所以范围是$ x >=t dot v = 4000 dot 40 dot 10^(-3) "bit" = 160 "bit" $
也就是至少160位.
])

#problem[
两个协议A和B唯一的差异在于它们的发送窗口的大小。协议A使用一个20帧的发送窗口，协议B是一个停-等式协议。这两个协议运行在两个相同的信道上。如果协议A达到了几乎100%的带宽效率，那么协议B的带宽效率是多少？
]
#solution[
协议A的效率是100%,则一个往返的时间可以发送20帧信息,也就是$20t = t+2f$.
B的效率是$t/(t+2f) times 100% = 5%$.f传输延迟,t是传输时间.
]
#problem[
在一个单向传输延迟为50ms的信道上使用900比特的帧，一个停-等式协议达到了25%的带宽效率，这个信道的带宽是多少？
]
#solution([
 f传输延迟,t是传输时间,那么$t/(t+2f) = 25% =>t=2/3 f = 2/3 dot 50 m s = 100/3 m s$.

 带宽是$900 /( 100/3 times 10^(-3)) = 27k b p s$.
])
#problem[
利用地球同步卫星在一个1Mb/s的信道上发送长度为1000位的帧，该信道与地球之间的传播延迟为270ms。确认总是被捎带在数据帧中。帧头非常短，序号使用了3位，在下面的协议中，可获得的最大信道利用率是多少？

（a）停-等式。

（b）协议5。（见教材P187）

（c）协议6。（见教材P190）
]
#solution([
  由于确认会在数据帧里,确认也要有发送时间,所以效率的分母需要多一个t.
   - (a). f = 270ms传输延迟,t是传输时间,且$ t=1000/(1 dot 10^6)s = 1 m s$.则效率是$t/(2t+2f) =1/542 $;
   - (b). 
])
#problem[
否定确认直接触发发送方的应答，而缺少肯定确认只是触发了超时之后的一个动作。是否有可能只使用否定确认，而不使用肯定确认来建立一个可靠的通信信道？如果有可能，请给出一个例子；如果不可能，请解释为什么。]
    #solution[
不可能.原因如下:

(1)如果一整个帧都丢失了,接收方肯定不会发送否定确认,因为他根本不知道这个帧的存在;那么发送方无法确认这个帧真的被正确接收了;

(2)发送方必须保存所有已发送的帧直到发送结束,因为发送方不知道什么帧是已经发送成功,什么是「失败了但是否定确认还没有发到发送方来」.如果发送大文件,会带来内存开销.
     
    ]

    #problem[
考虑在一个无错的64kb/s卫星信道上单向发送512字节长的数据帧，来自另一个方向反馈的确认非常短。对于窗口大小为1、7、15和127的情形，最大的吞吐量分别是多少？从地球到卫星的传播时间为270ms。
    ]

    #solution([
      f=270ms传输延迟,t是传输时间,此时$t =( 512 dot 8) /(64 dot 10^3) s =64m s$.

      吞吐量是$min((W dot 512dot 8)/(t+2f) ,64k b p s) = min((4096W)/(0.604),64k b p s)$.
      分别代入,可以得到:W=1,7,15,127,吞吐量分别是
      $1024/151 k b p s,7161/151 k b p s,64k b p s,64k b p s$.
    ])
