extends Node2D

onready var item = preload("res://Scenes/Item.tscn")

func get_player():
	if has_node("Player"):
		return $Player
	else:
		return false
	

func update_label(value):
	get_parent().update_label(value)

func _ready():
	var items = [["Зелье 1",10], ["Монета",100]]
	for i in range(30):
		randomize()
		var a = int(rand_range(0,2))
		var new_item = item.instance()
		$Items.add_child(new_item)
		new_item.set_item(items[a])
		new_item.position = Vector2(int(rand_range(0,32*31)),int(rand_range(0,32*18)))
	add_to_group(GlobalVars.saving_group)



func _unhandled_input(event):
	if event.is_action_pressed("Alt"):
		for i in get_tree().get_nodes_in_group(GlobalVars.entity_group):
			i.toggle_hp_bar()


func save():
	var data = {
		"filename": get_filename(),
		"player": $Player.save(),
		"item":[],
		"nature":[],
		"animals":[]
		
	}
	
	for item in	$Items.get_children():
		data["items"].append(item.save())
		
	for object in	$Nature.get_children():
		data["nature"].append(object.save())
		
	for animal in	$Anim.get_children():
		data["animal"].append(animal.save())
		
	return data
		
		
	
