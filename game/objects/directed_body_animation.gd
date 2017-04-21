
extends AnimationPlayer

const DIRS = preload("res://definitions/directions.gd")
const CONST = preload("res://definitions/constants.gd")

func track_movement(speed):
  var dir = DIRS.vec2dir(speed)
  if dir == DIRS.NONE: return
  dir = pvt_dirface(dir)
  var anim_type
  if speed.length_squared() > CONST.EPSILON*CONST.EPSILON:
    anim_type = "moving"
  else:
    anim_type = "idle"
  var anim = pvt_dirname(dir) + anim_type
  if get_current_animation() != anim:
      play(anim)

func pvt_dirface(dir):
  if dir == DIRS.UP:
    return DIRS.UP
  elif dir == DIRS.RIGHT:
    return DIRS.RIGHT
  elif dir == DIRS.DOWN:
    return DIRS.DOWN
  elif dir == DIRS.LEFT:
    return DIRS.LEFT
  elif dir == DIRS.UP_RIGHT:
    return DIRS.RIGHT
  elif dir == DIRS.DOWN_RIGHT:
    return DIRS.RIGHT
  elif dir == DIRS.DOWN_LEFT:
    return DIRS.LEFT
  elif dir == DIRS.UP_LEFT:
    return DIRS.LEFT

func pvt_dirname(dir):
  if dir == DIRS.UP:
      return "up_"
  elif dir == DIRS.RIGHT:
      return "right_"
  elif dir == DIRS.DOWN:
      return "down_"
  elif dir == DIRS.LEFT:
      return "left_"
  else:
      return "down_"
