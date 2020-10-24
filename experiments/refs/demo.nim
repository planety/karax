import ../src/karax/prelude
import std/[sugar, sequtils, jsconsole]

type
  CustomRef = ref object of VComponent

method onAttach(r: CustomRef) =
  console.log(cstring"custom ref attached")

method onDetach(r: CustomRef) =
  console.log(cstring"custom ref detached")

var
  modelData = @[5, 2, 4]

  refA = VComponent()
  refB = VComponent()
  refC = CustomRef()
  refSeq = newSeq[VComponent]()

proc onClick(ev: Event, n: VNode) =
  modelData.add(0)

proc showRefs() =
  console.log(refA)
  console.log(refB)
  console.log(refC)
  for i in 0 ..< refSeq.len:
    console.log(refSeq[i].vnode)
  #console.log(refSeq.map(nref => nref.vnode))

proc secureRefSlot(i: int): VComponent =
  while refSeq.len <= i:
    refSeq.add(VComponent())
  result = refSeq[i]

proc view(): VNode =
  result = buildHtml():
    tdiv:
      button(onclick=onClick):
        text "click me"
      # storing refs to single elements is straightforward now
      if modelData.len mod 2 == 0:
        tdiv(nref=refA):
          text "A"
        tdiv(nref=refB):
          text "B"
        tdiv(nref=refC):
          text "C"
      # It's a bit more tricky when containers are involved:
      for i, x in modelData.pairs:
        tdiv(nref=secureRefSlot(i)):
          text "List item: " & $x

proc renderer(): VNode =
  view()

setRenderer(renderer, "ROOT", showRefs)
