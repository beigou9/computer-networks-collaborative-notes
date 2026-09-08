#import "note.typ": *

// Front matter uses the plain page layout: license and table of contents do
// not participate in marginalia's cross-page bookkeeping.
#conf(
  author: "BJHH2005,kiwiizzz,xhkzdepartedream,Zoomy",
  title: "ComputerNetworks",
  cover: true,
  sidebar: false,
)[
  #include "license.typ"
  #pagebreak()
  #outline(depth: 2)
]

// The chapter body is the only section using the sidebar layout.
#pagebreak()
#conf(
  author: "BJHH2005,kiwiizzz,xhkzdepartedream,Zoomy",
  title: "ComputerNetworks",
  cover: false,
  sidebar: true,
  book: false,
)[
  #show: use-thmbox-notes
  #include "chapters/chap1_引言.typ"
  #include "chapters/chap2_物理层.typ"
  #include "chapters/chap3_数据链路层.typ"
  #include "chapters/chap4_MAC子层.typ"
  #include "chapters/chap5_网络层.typ"
  #include "chapters/chap6_传输层.typ"
  #include "chapters/chap7_应用层.typ"
]

// The index also needs to stay outside marginalia's layout state.
#conf(
  author: "BJHH2005,kiwiizzz,xhkzdepartedream,Zoomy",
  title: "ComputerNetworks",
  cover: false,
  sidebar: false,
)[
  #include "chapters/名词索引.typ"
]
