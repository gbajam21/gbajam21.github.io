include prelude

proc show =
  log "GAME OVER"

proc hide =
  log "bye"

proc update =
  discard

proc draw =
  discard

const TitleScene* = Scene(
  show: title.show,
  hide: title.hide,
  update: title.update,
  draw: title.draw,
)
