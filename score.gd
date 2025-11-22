extends Node

var score : int = 0
var high_score : int = 0

func add_pontos(amount: int):
	score += amount
	if score > high_score:
		high_score = score
		save_high_score()

func reset_score():
	score = 0

func save_high_score():
	var arquivo = FileAccess.open("user://save.dat", FileAccess.WRITE)
	arquivo.store_var(high_score)
	arquivo.close()

func load_high_score():
	if FileAccess.file_exists("user://save.dat"):
		var arq = FileAccess.open("user://save.dat", FileAccess.READ)
		high_score = arq.get_var()
		arq.close()
