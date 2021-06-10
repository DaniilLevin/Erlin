extends Control

func _ready():
	$Buttons/Button.connect("pressed", self, "change_scene", [$Buttons/Button.scene_to_open])

	$Buttons/Open_Load.connect("pressed", $Load, "open")
	$Buttons/Open_Load.connect("pressed", $Buttons, "hide")
	
	$Load/Box/Buttons/Cansel.connect("pressed", $Load, "hide")
	$Load/Box/Buttons/Cansel.connect("pressed", $Buttons, "show")
	
	
func change_scene(path):
	SceneChanger.change_scene(path)
