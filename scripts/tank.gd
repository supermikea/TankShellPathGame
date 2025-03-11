extends CharacterBody2D

@export var is_player: bool = false
@export var speed: float = 300.0
@export var rotate_sensitivity: float = 1.0

var StaticBullet = preload("res://scenes/StaticBullet.tscn")
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	# add the gravity
	velocity.y += gravity * delta
	
	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed # maybe add delta? idk needs testing | silvijn: nee vgm heeft physics_process dat built in ofzo
	# print(velocity)
	# print(is_on_floor())
	move_and_slide()
	
	var rotate_direction = Input.get_axis("rotate_gun_left", "rotate_gun_right")
	%GunMountPoint.rotation_degrees += rotate_direction * rotate_sensitivity
	
	if Input.is_action_just_pressed("shoot"): # TODO
		print("shot") # 
		var bullet :=  StaticBullet.instantiate()
		# bullet.rotation = %GunMountPoint.rotation
		bullet.position = %GunMountPoint.get_child(2).position
		
		get_tree().get_root().add_child(bullet)
