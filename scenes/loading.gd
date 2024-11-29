extends Control

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	ResourceLoader.load_threaded_request(Global.nextScene)

func _process(delta: float) -> void:
	var percentage = []
	ResourceLoader.load_threaded_get_status(Global.nextScene,percentage)
	$ProgressBar.value = percentage[0] * 100
	if percentage[0] == 1:
		await get_tree().create_timer(.5).timeout
		var scene = ResourceLoader.load_threaded_get(Global.nextScene)
		get_tree().change_scene_to_packed(scene)
