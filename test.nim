import src/karax/prelude
import std/[strformat]

# Tips
# toJSStr converts byte sequence to JS str.
# math, strformat, times, algorithm, parseutils, math

# Concept

# dom, 

# import parseutils

proc setVNodeAttrs(n: var VNode, attrs: openArray[(string, string)]) =
  for (key, value) in attrs:
    if value.len > 0:
      n.setAttr(key, value)
    else:
      n.setAttr(key)


type
  MenuMode* {.pure.} = enum
    horizontal, vertical

  BaseMenuItem* = object
    className: string
    index: int
    disabled: bool

  BaseMenu* = object
    className: string
    defaultIdx: int
    mode: MenuMode
    onSelect: proc (idx: int)

proc initMenuItem*(className = "", disabled = false): BaseMenuItem =
  BaseMenuItem(className: className, disabled: disabled)

proc menuItemName*(baseMenuItem: BaseMenuItem): string =
  result = "menu-item"

  if baseMenuItem.className.len > 0:
    result.add fmt"menu-{baseMenuItem.className}"

  if baseMenuItem.disabled:
    result.add "is-disabled"

proc build(baseMenuItem: BaseMenuItem, attrs: openArray[(string, string)]): VNode =
  let className = menuItemName(baseMenuItem)

  result = buildHtml:
    li(className = className)

  result.setVNodeAttrs(attrs)