extends Node2D


var gridSize = 32

export (PackedScene) var Floor
export (PackedScene) var Wall

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		print("Mouse Click/Unclick at: ", event.position)

		var position = Vector2()
		position.x = gridSize * round(event.position.x/gridSize)
		position.y = gridSize * round(event.position.y/gridSize)

		if(event.is_action_pressed("mouse_left")):
			var myFloor = Floor.instance()
			myFloor.position = position
			add_child(myFloor)
		elif(event.is_action_pressed("mouse_right")):
			var wall = Wall.instance()
			wall.position = position
			add_child(wall)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
