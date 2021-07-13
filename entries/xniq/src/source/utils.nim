import natu/[core, irq, video, tte, mgba, legacy]

template log*(args: varargs[untyped]) =
  discard
  # mgba.printf(args)
