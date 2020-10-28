extends Area2D


export var speed = 50
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	#hide()

func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		print("Mouse Click/Unclick at: ", event.position)
		print("down?: ", event.pressed)
		if(event.pressed):
			target = event.position

var target = position

func _process(delta):
	position.x = lerp(position.x, target.x, 10*delta)
	position.y = lerp(position.y, target.y, 10*delta)
	
#	var velocity = Vector2()  # The player's movement vector.
#	velocity.x = clamp(target.x-position.x, -1, 1)
#	velocity.y = clamp(target.y-position.y, -1, 1)

#	if Input.is_action_pressed("ui_right"):
#		velocity.x += 1
#	if Input.is_action_pressed("ui_left"):
#		velocity.x -= 1
#	if Input.is_action_pressed("ui_down"):
#		velocity.y += 1
#	if Input.is_action_pressed("ui_up"):
#		velocity.y -= 1
#	if velocity.length() > 0:
#		velocity = velocity.normalized() * speed
#	velocity*=speed
#
#	if Input.is_action_pressed("game_sprint"):
#		velocity *= 2
#
#	position += velocity * delta
	
	
	
	var spriteSize = $Sprite.texture.get_size()/2
	position.x = clamp(position.x, spriteSize.x, get_viewport_rect().size.x - spriteSize.x)
	position.y = clamp(position.y, spriteSize.y, get_viewport_rect().size.y - spriteSize.y)
	

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false



func _on_Player_body_entered(body):
	body.hide()
	print(body)
	print("bonk")

