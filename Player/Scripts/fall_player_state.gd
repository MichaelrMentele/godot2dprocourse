class_name FallPlayerState
extends State

func enter() -> void:
	player.sprite.play("Fall")

func exit() -> void:
	pass

func update(delta: float) -> void:
	var input_vector = player.get_input_vector()

	player.apply_movement(input_vector, delta)
	player.change_direction(input_vector.x)

	player.apply_gravity(delta)
	player.apply_velocity(delta)

	if player.is_on_floor():
		transition.emit("IdlePlayerState")

func physics_update(delta: float) -> void:
	pass
