
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

static func dir2vec(id):
    return DIRS[id]
