
extends Node

const DIRS = preload("res://definitions/directions.gd")

signal pressing_dir(dir)

func _ready():
	set_fixed_process(true)

func _fixed_process(dt):
  var dir = DIRS.NONE
  if Input.is_action_pressed("ui_up"):
    dir += DIRS.UP
  if Input.is_action_pressed("ui_down"):
    dir += DIRS.DOWN
  if Input.is_action_pressed("ui_right"):
    dir += DIRS.RIGHT
  if Input.is_action_pressed("ui_left"):
    dir += DIRS.LEFT
  emit_signal("pressing_dir", dir)
