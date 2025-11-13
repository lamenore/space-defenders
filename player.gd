extends CharacterBody3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	const SPEED = 10
	
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("move_down"):
		direction.y -= 1
	if Input.is_action_pressed("move_up"):
		direction.y += 1
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()
	
	velocity.y = direction.y * SPEED
	
	move_and_slide()
