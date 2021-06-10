extends "res://Scripts/Mage.gd"

var inventory = {}

signal on_death

func _ready():
	self.hp = 90
	set_start_hp(self.hp, self.max_hp)
	add_to_group(GlobalVars.entity_group)


func pick(item):
	var it = item.get_item()
	if it in inventory.keys():
		inventory[it][0] += item.get_amount()
	else:
		inventory[it] = [item.get_amount(), item.get_item_stack()]
	ui.update_inventory(inventory)

func _process(delta):
	
		var velocity = Vector2()
		if Input.is_action_pressed("Up"):
			velocity.y -= speed
		if Input.is_action_pressed("Down"):
			velocity.y += speed
		if Input.is_action_pressed("Left"):
			velocity.x -= speed
		if Input.is_action_pressed("Right"):
			velocity.x += speed
		move_and_slide(velocity)
	
		position.x = clamp(position.x, 0, 1000)
		position.y = clamp(position.y, 0, 1000)
		
		$DamagePosition.position = get_global_mouse_position() - position
		$DamagePosition.position.x = clamp($DamagePosition.position.x, -24, 40)
		$DamagePosition.position.y = clamp($DamagePosition.position.y, -24, 40)
		
func _unhandled_input(event):
	if event.is_action_pressed("inventory"):
		ui.toggle_inventory(inventory)
	if event.is_action_pressed("LeftClic"):
		var a = load("res://Scenes/DamageArea.tscn").instance()
		a.set_damage(10)
		get_parent().add_child(a)
		a.position = position + $DamagePosition.position


func die():
	emit_signal("on_death")
	.die()
	
func save():
	var data = .save()
	data["inventory"] = inventory
	return data
