extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var rng = RandomNumberGenerator.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rng.randomize()
	
	position.x += rng.randf_range(-1.0, 1.0)
	position.y += rng.randf_range(-1.0, 1.0)
	
	var spriteSize = $Sprite.texture.get_size()/2
	position.x = clamp(position.x, spriteSize.x, get_viewport_rect().size.x - spriteSize.x)
	position.y = clamp(position.y, spriteSize.y, get_viewport_rect().size.y - spriteSize.y)
