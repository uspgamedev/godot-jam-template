extends SamplePlayer2D

const SAMPLE = preload("res://effects/sound/sample.gd")

func _ready():
	for sample_node in self.get_children():
		if sample_node.get_script() == SAMPLE:
			get_sample_library().add_sample(sample_node.get_name(), sample_node.sample)
