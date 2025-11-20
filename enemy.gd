extends CharacterBody3D

@export var speed := 3.0
var has_hit_player = false

func _ready():
	$VisibleOnScreenNotifier3D.screen_exited.connect(_on_screen_exited)

func _physics_process(_delta):
	if has_hit_player:
		return
	
	var direction = Vector3(0, 0, -1)
	velocity = direction.normalized() * speed
	move_and_slide()
	
	#for i in get_slide_collision_count():
		#var collision = get_slide_collision(i)
		#var other = collision.get_collider()
		#if other and other.is_in_group("player") and not has_hit_player:
			#has_hit_player = true
			#other.take_damage(1)
			#$CollisionShape3D.disabled = true
			#queue_free()
			#break

func _on_screen_exited():
	queue_free()

func _on_area_3d_body_entered(body):
	if body.is_in_group("player") and not has_hit_player:
		has_hit_player = true
		body.take_damage(1)
		$Area3D/CollisionShape3D.set_deferred("disabled", true)
		queue_free()
		
