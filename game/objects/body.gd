
extends KinematicBody2D

const DIR = preload("res://definitions/directions.gd")

const ACC = 32
const DEACC = 0.75
const SPEEDLIMIT = ACC * 5
const EPSILON = 1

export(int, "none", "up", "right", "down", "left") var direction
export(bool) var strife

var speed = Vector2()

onready var animation = get_node("Sprite/Animation")

func _ready():
  set_process(true)
  set_fixed_process(true)

func _fixed_process(delta):
    pvt_apply_speed(delta)
    pvt_apply_speedlimit(delta)

func push(dir):
    if not strife: face(dir)
    self.speed += DIR.dir2vec(dir) * ACC

func pvt_apply_speed(delta):
  var motion_scale = self.speed * delta
  var motion = move(motion_scale)
  if is_colliding():
    var collider = get_collider()
    var normal = get_collision_normal()
    motion = normal.slide(motion)
    self.speed = normal.slide(self.speed)
    move(motion)

func pvt_apply_speedlimit(delta):
  self.speed *= DEACC
  if self.speed.length_squared() <= EPSILON*EPSILON:
    self.speed.x = 0
    self.speed.y = 0

func _process(delta):
  var anim_type
  if self.speed.length_squared() > EPSILON*EPSILON:
    anim_type = "moving"
  else:
    anim_type = "idle"
  var anim = get_animdirection() + anim_type
  if self.animation.get_current_animation() != anim:
      self.animation.play(anim)

func lock_face():
    self.strife = true

func unlock_face():
    self.strife = false

func face(dir):
  if dir == DIR.UP:
    self.direction = DIR.UP
  elif dir == DIR.RIGHT:
    self.direction = DIR.RIGHT
  elif dir == DIR.DOWN:
    self.direction = DIR.DOWN
  elif dir == DIR.LEFT:
    self.direction = DIR.LEFT
  elif dir == DIR.UP_RIGHT:
    self.direction = DIR.RIGHT
  elif dir == DIR.DOWN_RIGHT:
    self.direction = DIR.RIGHT
  elif dir == DIR.DOWN_LEFT:
    self.direction = DIR.LEFT
  elif dir == DIR.UP_LEFT:
    self.direction = DIR.LEFT


func get_animdirection():
  if self.direction == DIR.UP:
      return "up_"
  elif self.direction == DIR.RIGHT:
      return "right_"
  elif self.direction == DIR.DOWN:
      return "down_"
  elif self.direction == DIR.LEFT:
      return "left_"
  else:
      return "down_"
