extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var holding = false
var held = false
var mousePos = Vector2()
var offset = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		#print("Mouse Click/Unclick at: ", event.position)
		#print("down?: ", event.pressed)
		
		holding = event.pressed && hovering
		offset = position - event.position
		mousePos = event.position + offset
		
	elif event is InputEventMouseMotion:
		if(holding):
			mousePos = event.position + offset


func _integrate_forces(state):
	var deltaMove = (position - mousePos) * 10
	if(holding):
		print("drag")
		state.transform = Transform2D(0, mousePos)
		state.linear_velocity = Vector2()
		
		held = true
	elif(held && !holding):
		held = false
		state.linear_velocity = deltaMove
		
		
	
#	var spriteSize = $Sprite.texture.get_size()/2
#	position.x = clamp(position.x, spriteSize.x, get_viewport_rect().size.x - spriteSize.x)
#	position.y = clamp(position.y, spriteSize.y, get_viewport_rect().size.y - spriteSize.y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var hovering = false
func _on_Player_mouse_entered():
	hovering = true
func _on_Player_mouse_exited():
	hovering = false
