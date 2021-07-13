include prelude

type
  Level* = object
    lockedTileMax*: int
    frozenTileMax*: int
    bonusTileMax*: int
    bonusTileChance*: int
    timerScale*: Fixed
    levelUpTileCount*: int

const MasterSpeedThreshold* = fp 200
const GreatSpeedThreshold* = fp 500
const GoodSpeedThreshold* = fp 1000

const levelMax* = 9

var levels*: seq[Level]
levels.setLen(levelMax)

#level 1
levels[0].lockedTileMax = 0
levels[0].frozenTileMax = 0
levels[0].bonusTileMax = 1
levels[0].bonusTileChance = 0
levels[0].timerScale = fp 1
levels[0].levelUpTileCount = 30

#level 2
levels[1].lockedTileMax = 1
levels[1].frozenTileMax = 0
levels[1].bonusTileMax = 1
levels[1].bonusTileChance = 50
levels[1].timerScale = fp 1.2
levels[1].levelUpTileCount = 30

#level 3
levels[2].lockedTileMax = 1
levels[2].frozenTileMax = 0
levels[2].bonusTileMax = 1
levels[2].bonusTileChance = 40
levels[2].timerScale = fp 1.4
levels[2].levelUpTileCount = 30

#level 4
levels[3].lockedTileMax = 2
levels[3].frozenTileMax = 0
levels[3].bonusTileMax = 1
levels[3].bonusTileChance = 30
levels[3].timerScale = fp 1.6
levels[3].levelUpTileCount = 30

#level 5
levels[4].lockedTileMax = 2
levels[4].frozenTileMax = 0
levels[4].bonusTileMax = 1
levels[4].bonusTileChance = 20
levels[4].timerScale = fp 1.8
levels[4].levelUpTileCount = 30

#level 6
levels[5].lockedTileMax = 3
levels[5].frozenTileMax = 1
levels[5].bonusTileMax = 1
levels[5].bonusTileChance = 10
levels[5].timerScale = fp 2
levels[5].levelUpTileCount = 30

#level 7
levels[6].lockedTileMax = 3
levels[6].frozenTileMax = 1
levels[6].bonusTileMax = 1
levels[6].bonusTileChance = 10
levels[6].timerScale = fp 2.2
levels[6].levelUpTileCount = 30

#level 8
levels[7].lockedTileMax = 4
levels[7].frozenTileMax = 2
levels[7].bonusTileMax = 1
levels[7].bonusTileChance = 10
levels[7].timerScale = fp 2.4
levels[7].levelUpTileCount = 30

#level 9
levels[8].lockedTileMax = 4
levels[8].frozenTileMax = 2
levels[8].bonusTileMax = 1
levels[8].bonusTileChance = 10
levels[8].timerScale = fp 2.6
levels[8].levelUpTileCount = -1
