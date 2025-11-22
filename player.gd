extends CharacterBody3D

@onready var projectile = preload("res://projectile.tscn") 
@onready var timer = get_node("../Timer")
@onready var vida = get_tree().get_root().get_node("Fase1/Background/Player/Life/PlayerLife")
@onready var spriteVida = get_tree().get_root().get_node("Fase1/Background/Player/SpriteVida")

const SPEED = 10

var spawnedProjectiles: Array[Node] = []
var can_shoot = true

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if Input.is_action_pressed("shoot") and can_shoot:
		shoot()

func _physics_process(_delta: float) -> void:
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("move_down") or Input.is_action_pressed("ui_down"):
		direction.y -= 1
	if Input.is_action_pressed("move_up") or Input.is_action_pressed("ui_up"):
		direction.y += 1
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()
	
	velocity.y = direction.y * SPEED
	
	direction.x = 0
	
	move_and_slide()
	
	spriteVida.global_position = Vector3(self.global_position.x, self.global_position.y + 1, self.global_position.z - 0.3)
	
func _on_timer_timeout():
	can_shoot = true

func shoot() -> void:
	can_shoot = false
	var newProjectile = projectile.instantiate()
	var spawnArea = get_node("ProjectileSpawnPoint")
	
	newProjectile.rotation = spawnArea.rotation
	get_tree().get_root().add_child(newProjectile)
	newProjectile.global_position = Vector3(spawnArea.global_position.x, spawnArea.global_position.y, spawnArea.global_position.z + 3.0)
	
	spawnedProjectiles.append(newProjectile)
	
	timer.start()
	
func take_damage(amount: int):
	vida.value -= amount
	if vida.value <= 0:
		die()

func die():
	queue_free()
	get_tree().change_scene_to_file("res://end_screen.tscn")
