extends CharacterBody3D

@onready var projectile = preload("res://projectile.tscn")

const SPEED = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	
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
	var newProjectile = projectile.instantiate()
	var spawnArea = get_node("ProjectileSpawnPoint")
	var timer = get_node("../Timer")
	newProjectile.rotation = spawnArea.rotation
	get_tree().get_root().add_child(newProjectile)
	newProjectile.global_position = Vector3(spawnArea.global_position.x, spawnArea.global_position.y, spawnArea.global_position.z + 3.0)
	timer.start()
