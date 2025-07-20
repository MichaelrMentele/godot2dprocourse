class_name IdlePlayerState
extends State


func enter() -> void:
	player.sprite.play("Idle")
	player.velocity.x = 0.0

func exit() -> void:
	pass

func update(delta: float) -> void:
	var input_vector = player.get_input_vector()

	player.apply_gravity(delta)
	player.apply_velocity(delta)

	if input_vector.x != 0:
		transition.emit("RunningPlayerState")

	if Input.is_action_just_pressed("jump") and owner.is_on_floor():
		transition.emit("JumpPlayerState")

	if player.velocity.y > 1.0:
		transition.emit("FallPlayerState")

func physics_update(delta: float) -> void:
	pass
