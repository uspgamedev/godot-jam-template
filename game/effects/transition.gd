extends Node

export(String, FILE, "*.tscn") var next_scene_path

func go():
  get_tree().change_scene(next_scene_path)
