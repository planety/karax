
block:
  let tmp_402653306 = tree(VNodeKind.li)
  tmp_402653306.class = className
  addEventHandler(tmp_402653306, EventKind.onclick, proc (ev: Event; n: VNode) =
    inc menuCtx.idx
    menuCtx.onSelect(menuCtx.idx)(ev, n)

  , kxi)
  tmp_402653306

block:
  let tmp_402653442 = tree(VNodeKind.ul)
  tmp_402653442.class = className
  tmp_402653442
block:
  let tmp_402653488 = tree(VNodeKind.tdiv)
  block:
    let tmp_402653489 = tree(VNodeKind.link)
    setAttr(tmp_402653489, "rel", "stylesheet")
    setAttr(tmp_402653489, "type", "text/css")
    setAttr(tmp_402653489, "href", "styles/index.css")
    add(tmp_402653488, tmp_402653489)
  add(tmp_402653488, block:
    let tmp_402653490 = Menu(callback = hello)
    add(tmp_402653490, block:
      let tmp_402653491 = MenuItem()
      add(tmp_402653491, text "one is one")
      tmp_402653491)
    add(tmp_402653490, block:
      let tmp_402653492 = MenuItem()
      add(tmp_402653492, text "two is two")
      tmp_402653492)
    add(tmp_402653490, block:
      let tmp_402653493 = MenuItem()
      add(tmp_402653493, text "three is three")
      tmp_402653493)
    tmp_402653490)
  block:
    let tmp_402653494 = tree(VNodeKind.br)
    add(tmp_402653488, tmp_402653494)
  block:
    let tmp_402653495 = tree(VNodeKind.p)
    add(tmp_402653495, block:
      let tmp_402653496 = Menu()
      block:
        let tmp_402653497 = tree(VNodeKind.tdiv)
        add(tmp_402653497, block:
          let tmp_402653498 = MenuItem()
          add(tmp_402653498, text "Hello")
          tmp_402653498)
        add(tmp_402653496, tmp_402653497)
      tmp_402653496)
    add(tmp_402653495, block:
      let tmp_402653499 = Menu()
      add(tmp_402653499, MenuItem)
      tmp_402653499)
    add(tmp_402653488, tmp_402653495)
  add(tmp_402653488, block:
    let tmp_402653500 = Menu()
    add(tmp_402653500, block:
      let tmp_402653501 = MenuItem()
      add(tmp_402653501, text "Prologue")
      tmp_402653501)
    tmp_402653500)
  tmp_402653488
block:
  let tmp_402653954 = tree(VNodeKind.tdiv)
  tmp_402653954.class = class
  block:
    let tmp_402653955 = tree(VNodeKind.span)
    add(tmp_402653955, text message)
    add(tmp_402653954, tmp_402653955)
  tmp_402653954

if baseButton.typ == ButtonType.link and baseButton.href.len > 0:
  block:
    let tmp_402654102 = tree(VNodeKind.a)
    tmp_402654102.class = class
    setAttr(tmp_402654102, "href", baseButton.href)
    tmp_402654102
else:
  if baseButton.disabled:
    block:
      let tmp_402654103 = tree(VNodeKind.button)
      tmp_402654103.class = class
      setAttr(tmp_402654103, "disabled", $baseButton.disabled)
      tmp_402654103
  else:
    block:
      let tmp_402654104 = tree(VNodeKind.button)
      tmp_402654104.class = class
      tmp_402654104