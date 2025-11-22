extends CharacterBody3D

const SPEED = 5
const GRAVITY = 9.8
var vida := 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _physics_process(_delta: float) -> void:
	var direction = Vector3(0, 0, 1)
	velocity = direction.normalized() * SPEED
	move_and_slide()

func _on_screen_exited() -> void:
	queue_free()
