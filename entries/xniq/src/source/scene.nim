import natu/[core, video]

type Scene* = object
  show*: proc() {.nimcall.}
  hide*: proc() {.nimcall.}
  update*: proc() {.nimcall.}
  draw*: proc() {.nimcall.}

var
  display*: DispCnt  ## Buffered display control to avoid visual artifacts when loading the scene.
  sceneChanged = false
  currentScene, nextScene: Scene
  deferredFn: proc() {.nimcall.}  ## Code to be executed at the end of the frame.

proc nothing = discard
currentScene.show = nothing
currentScene.hide = nothing
currentScene.update = nothing
currentScene.draw = nothing

proc setScene*(s:Scene) =
  nextScene = s
  sceneChanged = true

proc reloadScene* =
  sceneChanged = true

proc updateScene* =
  if deferredFn != nil:
    deferredFn()
    deferredFn = nil
  
  if sceneChanged:
    sceneChanged = false
    dispcnt.init()
    display.init()
    # bgColorMem[0] = clrBlack
    currentScene.hide()
    currentScene = nextScene
    currentScene.show()
  
  currentScene.update()

proc drawScene* =
  currentScene.draw()
  dispcnt = display

proc deferFn*(f:proc(){.nimcall.}) =
  deferredFn = f
