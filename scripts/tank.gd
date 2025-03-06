extends CharacterBody2D

@export var is_player: bool = false
@export var speed: float = 300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	# add the gravity
	velocity.y += gravity * delta
	
	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed # maybe add delta? idk needs testing | silvijn: nee vgm heeft physics_process dat built in ofzo
	print(velocity)
	print(is_on_floor())
	move_and_slide()
