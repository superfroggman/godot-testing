extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var speed = 10
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2()  # The player's movement vector.

	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	velocity*=speed
	
	position += velocity * delta
	
	var spriteSize = $Sprite.texture.get_size()/2
	position.x = clamp(position.x, spriteSize.x, get_viewport_rect().size.x - spriteSize.x)
	position.y = clamp(position.y, spriteSize.y, get_viewport_rect().size.y - spriteSize.y)
