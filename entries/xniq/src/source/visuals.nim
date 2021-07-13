include prelude

{.push checks:off.}

type Visual = object
  open, close, update, draw: proc(){.nimcall.}

type VisualKind* = enum
  vkNone
  vkFactory

proc nothing = discard

var scroll: Vec2f
var alpha: Fixed

# Factory style BG
# ----------------

proc factoryOpen =
  bgcnt[3].init(cbb = 1, sbb = 29)
  bgcnt[3].load(bgFactory)
  bgcnt[2].init(cbb = 1, sbb = 28)
  bgcnt[2].load(bgDotsPattern)
  display.layers = display.layers + { lBg3, lBg2 }
  alpha = fp(0.25)

proc factoryClose =
  display.layers = display.layers - { lBg3, lBg2 }

proc factoryUpdate =
  scroll += vec2f(fp(0.5), fp(0.75))

proc factoryDraw =
  bgofs[2] = (-scroll).toBgPoint()
  
  let a = (alpha * 16).toInt()
  bldcnt.init(mode = bmAlpha, a = {blBg2}, b = blAll)
  bldalpha.eva = a.uint16
  bldalpha.evb = 16.uint16 - a.uint16
  


const Visuals = [
  vkNone: Visual(
    open: nothing,
    close: nothing,
    update: nothing,
    draw: nothing,
  ),
  vkFactory: Visual(
    open: factoryOpen,
    close: factoryClose,
    update: factoryUpdate,
    draw: factoryDraw,
  ),
]

var current: VisualKind

proc open*(next: VisualKind) =
  Visuals[current].close()
  current = next
  Visuals[current].open()

proc close* =
  Visuals[current].close()
  current = vkNone

proc update* =
  Visuals[current].update()

proc draw* =
  Visuals[current].draw()
