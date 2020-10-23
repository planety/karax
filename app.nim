import src/karax/prelude


when false:
  import std/[strformat, dom]
  block num_count:

    proc createDom(): proc(): VNode =
      var count = 0
      discard window.setInterval((proc() = inc count), 10)

      result = proc(): VNode =
        buildHtml(tdiv):
          text fmt"{count = }"

    setRenderer(createDom())

when false:
  block input:
    var message = "Hello, Karax"
    proc createDom(): VNode =
      result = buildHtml(tdiv):
        text message
        input(placeholder="Hello")

    setRenderer createDom

when true:
  import algorithm
  block button:
    proc createButton(message: var string): VNode =
      result = buildHtml(tdiv):
        button:
          proc onclick(ev: Event; n: VNode) =
            reverse(message)
          text "Reverse Message"

    proc createDom(): proc(): VNode =
      var message = "Hello, Karax!"

      result = proc(): VNode =
        buildHtml(tdiv):
          p: text message
          createButton(message)

    setRenderer createDom()

when false:
  import times
  import strformat

  block currentTime:
    proc createDom(): VNode =
      result = buildHtml(tdiv):
        span:
          text fmt"Data: {local(getTime())}"

    setRenderer createDom
