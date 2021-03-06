extends KinematicBody2D

onready var ui = get_viewport().get_node("Root/UI/Control") # ссылка на интерфейс

var speed = 200

onready var hp = 50
export var max_hp = 100

func _ready():
	set_start_hp(hp, max_hp)
	pass 
	
func set_start_hp(hp, max_hp):
	$HP_bar.value = hp
	$HP_bar.max_value = max_hp
	
func update_hp():
	$HP_bar.value = hp

func toggle_hp_bar():
	$HP_bar.visible = !$HP_bar.visible
	
func die():
	get_parent().remove_child(self)
	queue_free()
	
func reduce_hp(val):
	self.hp -= hp
	update_hp()
	if self.hp <= 0:
		die()
		return false
	return true
	
func save():
	var data = {
		"filename": get_filename(),
		"position": position,
		"speed": speed,
		"hp": hp,
		"max_hp": max_hp
	}
	return data
