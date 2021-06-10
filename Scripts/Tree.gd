extends "res://Scripts/Nature_object.gd"


onready var texture = 0

func _ready():
	randomize()
	var a = int(rand_range(1,3))
	$Sprite.texture = load("res://Sprits/Дерево %s.png" % str(a))
	
	pass 

func save():
	var data = .save()
	data["texture"] = texture
	return data
