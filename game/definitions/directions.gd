
const CONST = preload("res://definitions/constants.gd")

const NONE = 0
const UP = 1
const RIGHT = 2
const DOWN = 4
const LEFT = 8
const UP_RIGHT = UP + RIGHT
const DOWN_RIGHT = DOWN + RIGHT
const DOWN_LEFT = DOWN + LEFT
const UP_LEFT = UP + LEFT

const DIRS = [
  Vector2(),
  Vector2(0, -1),           # 1
  Vector2(1, 0),            # 2
  Vector2(1, -1)/sqrt(2),   # 3 = 1 + 2
  Vector2(0, 1),            # 4
  Vector2(),
  Vector2(1, 1)/sqrt(2),    # 6 = 4 + 2
  Vector2(),
  Vector2(-1, 0),           # 8
  Vector2(-1, -1)/sqrt(2),  # 9 = 1 + 8
  Vector2(),
  Vector2(),
  Vector2(-1, 1)/sqrt(2),   # 12 = 4 + 8
  Vector2(),
  Vector2(),
  Vector2(),
  Vector2(),
]

const INTERVALS = [
  UP_RIGHT, RIGHT, DOWN_RIGHT, DOWN, DOWN_LEFT, LEFT, UP_LEFT, UP
]

static func dir2vec(id):
  return DIRS[id]

static func vec2dir(vec):
  if vec.length_squared() < CONST.EPSILON*CONST.EPSILON:
    return NONE
  var angle = floor(3.5 - vec.angle()/(PI/4.0))
  return INTERVALS[angle]
