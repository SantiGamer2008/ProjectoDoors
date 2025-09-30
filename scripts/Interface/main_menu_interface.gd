extends Control

@onready var MainButtons: Control = $Main
@onready var OptionsButtons: Control = $Options

@onready var Tempo: Timer = $Timer
@onready var Fade: ColorRect = $Fade

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Tempo.time_left > 0:
		var t = 1.0 - (Tempo.time_left / Tempo.wait_time)
		Fade.modulate.a = 1.0 - t
	else:
		Fade.modulate.a = 0.0

#---------------------------------------#
#                 Main                  #
#---------------------------------------#

func _on_play_pressed() -> void:
	pass # Replace with function body.


func _on_options_pressed() -> void:
	MainButtons.visible = false
	OptionsButtons.visible = true


func _on_exit_game_pressed() -> void:
	get_tree().quit()

#---------------------------------------#
#               Options                 #
#---------------------------------------#

func _on_back_pressed() -> void:
	MainButtons.visible = true
	OptionsButtons.visible = false

#---------------------------------------#
#                Others                 #
#---------------------------------------#

func _on_timer_timeout() -> void:
	MainButtons.visible = true
	Fade.color = Color(0.0, 0.0, 0.0, 0.0)
