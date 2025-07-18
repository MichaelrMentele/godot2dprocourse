class_name JumpPlayerState
extends State

func enter() -> void:
	player.sprite.play("Jump")
	player.apply_jump()

func exit() -> void:
	pass

func update(delta: float) -> void:
	var input_vector = player.get_input_vector()

	player.apply_movement(input_vector, delta)
	player.change_direction(input_vector.x)

	player.apply_gravity(delta)
	player.apply_velocity(delta)

	if player.velocity.y > 1.0:
		transition.emit("FallPlayerState")

func physics_update(_delta: float) -> void:
	pass
