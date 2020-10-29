import src/karax/prelude
import src/karax/jdict
import strformat

var globalTables = newJDict[int, int]()
var globalCounter = -1


type
  State = tuple
    value: int
    setValue: proc(newValue: int) {.closure.}


proc useState(initial: int): State =
  inc globalCounter

  let times = globalCounter

  if times in globalTables:
    discard
  else:
    globalTables[times] = initial

  proc setState(newValue: int) =
    echo newValue
    globalTables[times] = newValue

  result = (globalTables[times], setState)

proc stat(): VNode =
  var (state, setState) = useState(0)
  echo fmt"{state = }"
  result = buildHtml(tdiv):
    h2: text $state

    button:
      proc onClick(ev: Event, n: VNode) =
        inc state
        setState(state)
      text "Click Me"

proc hello(): VNode =
  globalCounter = -1

  var (state, setState) = useState(0)
  result = buildHtml(tdiv):
    h1(): text $state
    button:
      proc onClick(ev: Event, n: VNode) =
        inc state
        setState(state)
      text "Click Me"

    stat()


setRenderer hello


# type
#   State[T] = tuple
#     value: T
#     setState: proc (newState: T) {.closure.}

# proc useState[T](defaultValue: T): State[T] =
#   var defaultValue = defaultValue
#   let setState = proc (newState: T) =
#     defaultValue = newState

#   result = (defaultValue, setState)

# proc hello() =
#   let (state, setState) = useState[int](0)
#   setState(state + 1)
#   echo state

# for i in 0 ..< 10:
#   hello()

# type
#   State = tuple
#     value: int
#     setState: proc (newState: int) {.closure, gcsafe.}

# var defaultVal: int
# var first = true


# proc useState(defaultValue: int): State =
#   if first:
#     defaultVal = defaultValue
#     first = false
#   let setState = proc (newState: int) {.closure, gcsafe.} =
#     defaultVal = newState

#   result = (defaultVal, setState)

# proc hello() =
#   let (state, setState) = useState(0)
#   setState(state + 1)
#   echo state

# for i in 0 ..< 10:
#   hello()