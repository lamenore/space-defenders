extends CharacterBody3D

@onready var projectile = preload("res://projectile.tscn")
@onready var attach_projectile = $Area3D
@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	const SPEED = 5
	
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("move_down"):
		direction.y -= 1
	if Input.is_action_pressed("move_up"):
		direction.y += 1
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()
	
	velocity.y = direction.y * SPEED
	
	move_and_slide()


func _on_timer_timeout() -> void:
	var new_projectile = projectile.instantiate()
	attach_projectile.add_child(new_projectile)
	timer.start()
