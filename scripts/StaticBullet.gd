extends Area2D

@export var initial_speed: float = 100.0
@onready var speed: float = initial_speed
@onready var velocity: float = 0

# speed get's multipled with normal vector that gives the direction
func _physics_process(delta: float) -> void:
	pass
