extends Node2D

export (PackedScene) var Mob

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var mob = Mob.instance()
	add_child(mob)

var rng = RandomNumberGenerator.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	rng.randomize()
	
	if(rng.randf_range(-1.0, 1.0)>0.9):
		var mob = Mob.instance()
		mob.position.x = rng.randf_range(0, get_viewport_rect().size.x)
		mob.position.y = rng.randf_range(0, get_viewport_rect().size.y)
		add_child(mob)
