extends CanvasLayer

@onready var heart_1 : TextureRect = $HBoxContainer/TextureRect
@onready var heart_2 : TextureRect = $HBoxContainer/TextureRect2
@onready var heart_3 : TextureRect = $HBoxContainer/TextureRect3

var full_heart = "res://resources/Tiles/tile_0044.png"
var empty_heart = "res://resources/Tiles/tile_0046.png"

func adjust_health(health: int) -> void:
	if health == 3:
		heart_3.texture = ResourceLoader.load(full_heart)
	else:
		heart_3.texture = ResourceLoader.load(empty_heart)
		
	if health >= 2:
		heart_2.texture = ResourceLoader.load(full_heart)
	else:
		heart_2.texture = ResourceLoader.load(empty_heart)
		
	if health >= 1:
		heart_1.texture = ResourceLoader.load(full_heart)
	else:
		heart_1.texture = ResourceLoader.load(empty_heart)

func highscore():
	$HighScoreScreen.visible = true
	
func final_score():
	if $HighScoreScreen.visible:
		$HighScoreScreen.visible = false
		
	$FinalScoreScreen/Score.text = str("Final Score: %s" % Globals.score)
	$FinalScoreScreen/HighScore.text = str("High Score: %s" % Globals.high_score)
	$FinalScoreScreen.visible = true
	$Highscore.visible = false
	$Score.visible = false
