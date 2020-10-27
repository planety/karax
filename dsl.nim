let tmp_402653701 = tree(VNodeKind.tdiv)

let tmp_402653702 = tree(VNodeKind.link)
setAttr(tmp_402653702, "rel", "stylesheet")
setAttr(tmp_402653702, "type", "text/css")
setAttr(tmp_402653702, "href", "styles/index.css")
add(tmp_402653701, tmp_402653702)

let tmp_402653703 = tree(VNodeKind.p)
add(tmp_402653703):
  let tmp_402653704 = Button("Super", false, ButtonSize.large,
                             ButtonType.primary, "", attrs)
  add(tmp_402653704, text "Click Here")
  addEventHandler(tmp_402653704, EventKind.onclick, proc (ev: Event; n: VNode) =
    echo "Hallo"
  , kxi)

  tmp_402653704

add(tmp_402653703):
  let tmp_402653705 = Button("Super", false, ButtonSize.base, ButtonType.danger,
                             "", attrs)
  add(tmp_402653705, text "Click Here")
  addEventHandler(tmp_402653705, EventKind.onclick, proc (ev: Event; n: VNode) =
    echo "see"
  , kxi)

  tmp_402653705

add(tmp_402653703):
  let tmp_402653706 = Button("Super", false, ButtonSize.small,
                             ButtonType.default, "", attrs)
  add(tmp_402653706, text "Click Here")
  addEventHandler(tmp_402653706, EventKind.onclick, proc (ev: Event; n: VNode) =
    echo "text"
  , kxi)

  tmp_402653706

add(tmp_402653701, tmp_402653703)
let tmp_402653707 = tree(VNodeKind.p)

add(tmp_402653707):
  let tmp_402653708 = Button("Super", true, typ = ButtonType.primary)
  add(tmp_402653708, text "Click Here")
  addEventHandler(tmp_402653708, EventKind.onclick, proc (ev: Event; n: VNode) =
    echo "seed"
  , kxi)

  tmp_402653708

add(tmp_402653707):
  let tmp_402653709 = Button("Super", false, ButtonSize.base, ButtonType.link,
                             "http://www.google.com", attrs)
  add(tmp_402653709, text "Click Here")
  addEventHandler(tmp_402653709, EventKind.onclick, proc (ev: Event; n: VNode) =
    echo "clean"
  , kxi)

  tmp_402653709

add(tmp_402653707):
  let tmp_402653710 = Button()
  add(tmp_402653710, text "hello")
  tmp_402653710

add(tmp_402653701, tmp_402653707)

tmp_402653701
