extends Node

signal update_score

var high_score : int = 0:
	set(value):
		high_score = value
		update_score.emit()

var score : int = 0:
	set(value):
		score = value
		update_score.emit()

func save_score():
	var game_save = FileAccess.open("user://savegame.txt", FileAccess.WRITE)
	var save_data = {
		"high_score": high_score
	}
	var json_string = JSON.stringify(save_data)
	game_save.store_line(json_string)
	
func load_score():
	if not FileAccess.file_exists("user://savegame.txt"):
		print("No save file")
		return
		
	var game_save = FileAccess.open("user://savegame.txt", FileAccess.READ)
	
	while game_save.get_position() < game_save.get_length():
		var json_string = game_save.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue
			
		var save_data = json.get_data()
		high_score = save_data["high_score"]
