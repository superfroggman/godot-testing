extends RigidBody

var speed = 100
var rotSpeed = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _process(delta):
	var acceleration = Vector3()  # The player's movement vector.

	if Input.is_action_pressed("forward"):
		acceleration.x += 1
	if Input.is_action_pressed("back"):
		acceleration.x -= 1
	if Input.is_action_pressed("right"):
		acceleration.z += 1
	if Input.is_action_pressed("left"):
		acceleration.z -= 1
		
	if Input.is_action_pressed("game_sprint"):
		acceleration *= 2
		
	acceleration*=speed
	acceleration*=delta

	#global_translate(acceleration)

	#apply_central_impulse(acceleration)
		
	var torque = Vector3()
	if Input.is_action_pressed("ui_right"):
		torque.x += 1
	if Input.is_action_pressed("ui_left"):
		torque.x -= 1
	if Input.is_action_pressed("ui_down"):
		torque.z += 1
	if Input.is_action_pressed("ui_up"):
		torque.z -= 1
		
	torque*=rotSpeed	
	torque*=delta
	
	add_torque(torque)
	
