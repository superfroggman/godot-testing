extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

var speed = 4
var mouseSensitivity = 0.01

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector3()  # The player's movement vector.

	if Input.is_action_pressed("ui_right"):
		velocity.z += 1
	if Input.is_action_pressed("ui_left"):
		velocity.z -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_up"):
		velocity.x += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	velocity*=speed
	
	move_and_slide(velocity, Vector3(0,1,0), false, 4, .75, true)

	if Input.is_action_pressed("game_sprint"):
		velocity *= 2


	#translate(velocity*delta)
	
func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x*0.01)
		$Camera.rotate_z(-event.relative.y*0.01)
		
		

