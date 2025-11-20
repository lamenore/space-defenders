#Gerador de Inimigos
extends Node3D

@export var enemy_scene: PackedScene

func _ready():
	$Timer.timeout.connect(_on_timer_timeout)
	
func _on_timer_timeout():
	var enemy: CharacterBody3D = enemy_scene.instantiate()
	var vec = Vector3(global_position.x, randf_range(-4.0, 12.0), global_position.z)
	get_parent().add_child(enemy)
	enemy.global_position = vec
