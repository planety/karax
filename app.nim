# import src/karax/prelude

# Tips
# toJSStr converts byte sequence to JS str.
# math, strformat, times, algorithm, parseutils, math

# Concept

# dom, 

# import parseutils

when false:
  import src/karax/prelude
  import dom, times

  block:
    proc createDom(): VNode =
      result = buildHtml(tdiv):
        p: text "Add Events"

        button:
          text "Click Here"
          proc onclick(ev: Event; n: VNode) =
            getVNodeById("time").text = $local(getTime())

          proc onclick(ev: Event; n: VNode) =
            echo "Hello"

        p(id = "time")

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
