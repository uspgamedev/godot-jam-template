
extends Control

export (float) var wait_time_per_image

signal done_showing_all_images()

onready var timer = get_node("Timer")
onready var images = get_node("Images")
onready var fader = get_node("Fader")
onready var transition = get_node("Transition")

func _ready():
  hide_all()
  timer.set_wait_time(0.5)
  timer.start()
  yield(timer, "timeout")
  #call_deferred("play")
  play()

func hide_all():
  for img in images.get_children():
    img.hide()

func play():
  var wait_time = wait_time_per_image / 3
  timer.set_wait_time(wait_time)
  for img in images.get_children():
    # fade in
    img.show()
    fader.fade_in()
    yield(fader, "done_fade_in")
    # wait
    timer.start()
    yield(timer, "timeout")
    # fade out
    fader.fade_out()
    yield(fader, "done_fade_out")
    img.hide()
  transition.go()
