import src/karax/prelude
import std/[strformat, dom]

# Tips
# toJSStr converts byte sequence to JS str.
# math, strformat, times, algorithm, parseutils, math

# Concept

# dom, 

# import parseutils

template setVNodeAttrs(n: var VNode, attrs: openArray[(string, string)]) =
  for (key, value) in attrs:
    if value.len > 0:
      n.setAttr(key, value)
    else:
      n.setAttr(key)

type
  MenuMode* {.pure.} = enum
    horizontal, vertical

  BaseMenuItem* = object
    index: int
    className: string
    disabled: bool

  OnSelectCallback* = proc(idx: int): EventHandler

  BaseMenu* = object
    className: string
    defaultIdx: int
    mode: MenuMode

  MenuContext* = ref object
    index: int
    onSelect: OnSelectCallback

proc initMenuItem*(index: int, className = "", disabled = false): BaseMenuItem =
  BaseMenuItem(index: index, className: className, disabled: disabled)

proc menuItemClass*(baseMenuItem: BaseMenuItem, ctx: MenuContext): string =
  result = "menu-item"

  if baseMenuItem.className.len > 0:
    result.add fmt" menu-{baseMenuItem.className}"

  if baseMenuItem.disabled:
    result.add " is-disabled"

  if ctx.index == baseMenuItem.index:
    result.add " is-active"

proc build(
  baseMenuItem: BaseMenuItem,
  ctx: var MenuContext,
  attrs: openArray[(string, string)]
): VNode =
  let className = menuItemClass(baseMenuItem, ctx)
  result = buildHtml:
    li(class = className):
      proc onClick(ev: Event, n: VNode) =
        ctx.index = baseMenuItem.index
        if ctx.onSelect != nil and (not baseMenuItem.disabled):
          ctx.onSelect(ctx.index)(ev, n)

  result.setVNodeAttrs(attrs)

proc registerMenuItem*(
  index: int,
  ctx: var MenuContext,
  className = "",
  disabled = false,
  attrs: openArray[(string, string)] = {:}
): VNode =
  let baseMenuItem = BaseMenuItem(index: index, className: className, disabled: disabled)
  build(baseMenuItem, ctx, attrs)

template MenuItem*(className = "", disabled = false, attrs: openArray[(string, string)] = {:}): VNode =
  mixin menuCtx
  mixin menuInternalIndex
  when not declared(menuCtx):
    static:
      raise newException(ValueError, "MenuItem must be used with Menu!")

  inc menuInternalIndex
  registerMenuItem(menuInternalIndex, menuCtx, className, disabled, attrs)

proc initMenu*(className = "", mode = MenuMode.horizontal): BaseMenu =
  BaseMenu(className: className, mode: mode)

proc menuClass*(baseMenu: BaseMenu): string =
  result = "menu"

  if baseMenu.className.len > 0:
    result.add fmt" menu-{baseMenu.className}"

  result.add fmt" menu-{baseMenu.mode}"

proc build*(baseMenu: BaseMenu, attrs: openArray[(string, string)]): VNode =
  let className = menuClass(baseMenu)

  result = buildHtml:
    ul(class = className)

  setVNodeAttrs(result, attrs)

proc registerMenu(className = "", mode = MenuMode.horizontal, attrs: openArray[(string, string)] = {:}): VNode =
  let baseMenu = BaseMenu(className: className, mode: mode)
  build(baseMenu, attrs)

template Menu*(ctx: MenuContext, className = "", mode = MenuMode.horizontal, callback: OnSelectCallback = nil,
      attrs: openArray[(string, string)] = {:}): VNode =
  var menuCtx {.inject.} = ctx
  var menuInternalIndex {.inject.} = -1
  registerMenu(className, mode, attrs)


when true:
  block:
    proc hello(idx: int): EventHandler =
      result = proc (ev: Event, n: VNode) =
        window.alert $(idx)

    var ctx1 = MenuContext(index: 0, onSelect: hello)
    var ctx2 = MenuContext(index: 0)

    setRenderer proc(): VNode =
      result = buildHtml(tdiv):
        link(rel="stylesheet", `type` = "text/css", href = "styles/index.css")
        Menu(ctx1):
          MenuItem:
            text "one is one"
          MenuItem(disabled = true):
            text "two is two"
          MenuItem:
            text "three is three"

        br()

        p:
          Menu(ctx2, mode = MenuMode.vertical):
            MenuItem:
              text "one is one"
            MenuItem:
              text "two is two"
            MenuItem:
              text "three is three"


type
  AlertType* = enum
    success, info, warning, error

  BaseAlert* = object
    className: string
    typ: AlertType
    message: string

proc initAlert*(
  className = "",
  typ = AlertType.success,
  message = ""
): BaseAlert =
  BaseAlert(className: className, typ: typ, message: message)

proc alertClass*(baseAlert: BaseAlert): string =
  result = "alert"

  if baseAlert.className.len > 0:
    result.add fmt" alert-{baseAlert.className}"

  result.add fmt" alert-{baseAlert.typ}"

proc build*(baseAlert: BaseAlert, attrs: openArray[(string, string)]): VNode =
  let class = alertClass(baseAlert)

  let message =
    if baseAlert.message.len > 0:
      baseAlert.message
    else:
      case baseAlert.typ
      of AlertType.success:
        "Success Text"
      of AlertType.info:
        "Info Text"
      of AlertType.warning:
        "Warning Text"
      of AlertType.error:
        "Error Text"

  result = buildHtml(tdiv(class = class)):
    span: text message

  setVNodeAttrs(result, attrs)

proc Alert*(
  className = "",
  typ = AlertType.success,
  message = "",
  attrs: openArray[(string, string)] = {:}
): VNode =
  let alert = BaseAlert(className: className, typ: typ, message: message)
  build(alert, attrs)

when false:
  block:
    proc createDom(): VNode =
      result = buildHtml(tdiv):
        link(rel="stylesheet", `type` = "text/css", href = "styles/index.css")
        Alert()

    setRenderer(createDom)

type
  ButtonSize* {.pure.} = enum
    base, large, small
  ButtonType* {.pure.} = enum
    primary, default, danger, link
  BaseButton* = object
    className: string
    disabled: bool
    size: ButtonSize
    typ: ButtonType
    href: string

proc buttonClass(baseButton: BaseButton): string =
  result = "btn"
  if baseButton.className.len > 0:
    result.add " " & baseButton.className

  result.add fmt" btn-{baseButton.typ}"

  if baseButton.size != ButtonSize.base:
    result.add fmt" btn-{baseButton.size}"

  if baseButton.typ == ButtonType.link and baseButton.disabled:
    result.add fmt" disabled"

proc initButton*(
  className = "", disabled = false, size = ButtonSize.base,
  typ = ButtonType.primary, href = ""
): BaseButton {.inline.} =
  BaseButton(className: className, disabled: disabled, 
                          size: size, typ: typ, href: href)

proc build*(
  baseButton: BaseButton,
  attrs: openArray[(string, string)]
): VNode =
  let class = buttonClass(baseButton)

  result = buildHtml:
    if baseButton.typ == ButtonType.link and baseButton.href.len > 0:
      a(class = class, href = baseButton.href)
    else:
      if baseButton.disabled:
        button(class = class, disabled = $baseButton.disabled)
      else:
        button(class = class)

  setVNodeAttrs(result, attrs)

proc Button*(className = "", disabled = false, size = ButtonSize.base,
  typ = ButtonType.primary, href = "", attrs: openArray[(string, string)] = {:}): VNode =
  let btn = BaseButton(className: className, disabled: disabled, 
                          size: size, typ: typ, href: href)
  build(btn, attrs)

when false:
  var attrs = {"autofocus": "true", "setFocus": ""}
  block:
    proc createDom(): VNode =
      result = buildHtml(tdiv):
        link(rel="stylesheet", `type` = "text/css", href = "styles/index.css")
        p:
          Button("Super", false, ButtonSize.large, ButtonType.primary, "", attrs):
            text "Click Here"
            proc onclick(ev: Event, n: VNode) =
              echo "Hallo"

          Button("Super", false, ButtonSize.base, ButtonType.danger, "", attrs):
            text "Click Here"
            proc onclick(ev: Event, n: VNode) =
              echo "see"

          Button("Super", false, ButtonSize.small, ButtonType.default, "", attrs):
            text "Click Here"
            proc onclick(ev: Event, n: VNode) =
              echo "text"
        p:
          Button("Super", true, typ = ButtonType.primary):
            text "Click Here"
            proc onclick(ev: Event, n: VNode) =
              echo "seed"
          Button("Super", false, ButtonSize.base, ButtonType.link, "http://www.google.com", attrs):
            text "Click Here"
            proc onclick(ev: Event, n: VNode) =
              echo "clean"
          Button:
            text "hello"

    setRenderer createDom


when false:
  block:
    var count = 0
    proc createDom(): VNode =
      result = buildHtml(tdiv):
        link(rel="stylesheet", `type` = "text/css", href = "styles/index.css")
        h1: text "Home"
        h2: text "Karax"
        hr()
        p:
          code: text "Nim"
        label(id = "demo"):
          text $count

        br()

        button:
          text "Click Here"
          proc onclick(ev: Event, n: VNode) =
            inc count
            # echo getVNodeById("demo").dom.outerHTML
            # getVNodeById("demo").dom.outerHTML = &"<input id=\"demo\" type=\"number\" value=\"{count}\">"

    setRenderer(createDom)


when false:
  import times

  block:
    var message = ""

    proc para(): VNode =
      result = buildHtml(p):
        text "New paragraph"

    proc createDom(): VNode =
      result = buildHtml(tdiv):
        para()

        button:
          text "Click Here"
          proc onclick(ev: Event; n: VNode) =
            message = $local(getTime())

          proc onclick(ev: Event; n: VNode) =
            echo "Hello"

        p(id = "time"):
          text message

    setRenderer(createDom)

when false:
  import src/karax/prelude
  import dom, times

  block:
    var message: string

    proc createDom(): VNode =
      result = buildHtml(tdiv):
        p: text "Add Events"

        button:
          text "Click Here"
          proc onclick(ev: Event; n: VNode) =
            message = $local(getTime())

          proc onclick(ev: Event; n: VNode) =
            echo "Hello"

        p(id = "time"):
          text message


    setRenderer(createDom)

when false:
  import dom
  import src/karax/vstyles

  block:
    proc createDom(): VNode =
      let message = "Mouse over me"
      let style = "background-color:#D94A38;width:120px;height:20px;padding:40px;"
      result = buildHtml(tdiv(style = style.toCSS, id = "back")):
        text message

        proc onmouseover(ev: Event, n: VNode) =
          # if not nil
          n.dom.innerHtml = "Great!"

        proc onmouseout(ev: Event, n: VNode) =
          # if not nil
          n.dom.innerHtml = message

    setRenderer(createDom)


when false:
  import dom, strformat, times, strutils

  block:
    proc createDom(): VNode =
      result = buildHtml(tdiv):
        h1: text "Web Page"

        p(id="karax"):
          text "Need to change"

        input(`type`="text", id="fname"):
          proc onchange(ev: Event, n: VNode) =
            n.value = n.value.toUpperCase

        button:
          text "Click Here!"
          proc onclick(ev: Event; n: VNode) =
            # window.alert($(12 + 8))
            document.getElementById("karax").innerHtml = "Hello, Karax!"

      # document.write($local(getTime()))

    setRenderer(createDom)



# proc createDom(): VNode =
    #   <div className="App">
    #   <Router>
    #     <MuiThemeProvider muiTheme={muiTheme}>
    #       <div id="container">
    #         <div id="headContainer">
    #           <Head />
    #         </div>
    #         <div id="bodyContainer">
    #           <Switch>
    #             <Route path="/" exact component={Home} />
    #             <Route path="/login" component={Login} />
    #             <Route path="/logout" component={Logout} />
    #             <Route path="/products" exact component={Products} />
    #             <Route path="/products/import" component={ProductImport} />
    #             <Route
    #               path="/products/categories"
    #               exact
    #               component={ProductCategories}
    #             />
    #             <Route path="/orders" exact component={Orders} />
    #             <Route
    #               path="/orders/statuses"
    #               exact
    #               component={OrderStatuses}
    #             />
    #             <Route path="/order/:orderId" exact component={OrderDetails} />
    #             <Route path="/customers" exact component={Customers} />
    #             <Route
    #               path="/customers/groups"
    #               exact
    #               component={CustomerGroups}
    #             />
    #             <Route
    #               path="/customer/:customerId"
    #               exact
    #               component={CustomerDetails}
    #             />
    #             <Route path="/product/:productId" component={ProductDetails} />
    #             <Route path="/pages" exact component={Pages} />
    #             <Route path="/pages/add" exact component={PagesDetails} />
    #             <Route path="/pages/:pageId" component={PagesDetails} />
    #             <Route path="/settings" component={Settings} />
    #             <Route path="/apps" component={Apps} />
    #             <Route path="/files" exact component={Files} />
    #             <Route component={NotFound} />
    #           </Switch>
    #         </div>
    #       </div>
    #     </MuiThemeProvider>
    #   </Router>
    # </div>


when false:
  import dom, strformat

  block:
    var count = 0

    proc createDom(): VNode =
      result = buildHtml(tdiv):
        button:
          proc onclick(ev: Event; n: VNode) =
            inc count
            if (count >= 10):
              window.alert("count is dangerously high!")
              count = 0

          if count > 1:
            text fmt"Clicked {count} times"
          else:
            text fmt"Clicked {count} time"

    setRenderer(createDom)

when false:
  import random
  block button:
    var count = 0

    proc createDom(): VNode =
      result = buildHtml(tdiv):
        text $rand(10)
        br()
        button:
          proc onclick(ev: Event; n: VNode) =
            inc count
          text "Click Here"
    
    setRenderer(createDom)

when false:
  import strformat
  block button:
    var count = 0

    proc createDom(): VNode =
      result = buildHtml(tdiv):
        button:
          proc onclick(ev: Event; n: VNode) =
            inc count

          if count > 1:
            text fmt"Clicked {count} times"
          else:
            text fmt"Clicked {count} time"
    
    setRenderer(createDom)

when false:
  import strformat

  block hello_world:
    let name = "Prologue"
    proc createDom(): VNode =
      result = buildHtml(tdiv):
        text fmt"Hello, {name}!"

    setRenderer(createDom)

when false:
  import strformat

  block dynamic_attributes:
    let 
      src = "assets/benchmark.png"
      name = "xflywind"

    proc createDom(): VNode =
      result = buildHtml(tdiv):
        img(src=src, alt=fmt"{name} benchmark")

    setRenderer(createDom)


when false:
  # count
  proc createDom(): proc(): VNode =
    var count = 0

    result = proc(): VNode =
      buildHtml(tdiv):
        input(`type` = "number", value = $count)
        button:
          text "count"
          proc onclick(ev: Event; n: VNode) =
            inc count

  setRenderer(createDom())

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

when false:
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

when false:
  import src/karax/autocomplete

  const suggestions = @[cstring"ActionScript",
    "AppleScript",
    "Asp",
    "BASIC",
    "C",
    "C++",
    "Clojure",
    "COBOL",
    "Erlang",
    "Fortran",
    "Groovy",
    "Haskell",
    "Java",
    "JavaScript",
    "Lisp",
    "Nim",
    "Perl",
    "PHP",
    "Python",
    "Ruby",
    "Scala",
    "Scheme"]

  var s = newAutocomplete(suggestions)

  proc main(): VNode =
    result = buildHtml(tdiv):
      autocomplete(s, proc (s: cstring) = echo "now ", s):
        proc onchange(ev: Event; n: VNode) =
          echo "now selected ", n.kind

  setRenderer(main)

when false:
  setRenderer proc(): VNode =
    result = buildHtml(tdiv):
      text "Select text:"
      input(`type` = "text", value = "Hello world!"):
        proc onselect(ev: Event, n: VNode) =
          window.alert("You have selected some of the text: ")

      br()

      text "Select text:"
      textarea(cols = "20", rows = "5"):
        text "Hello world!"
        proc onselect() =
          window.alert("You have selected some of the text.")
