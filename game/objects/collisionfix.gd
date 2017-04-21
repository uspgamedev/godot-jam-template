
extends CollisionShape2D

func _ready():
    get_parent().remove_shape(0)
    get_parent().add_shape(get_shape())
