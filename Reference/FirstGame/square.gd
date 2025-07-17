extends CharacterBody2D

@export var gravity : float = 980.0
@export var speed : float = 300.0

var start_pos

func _ready() -> void:
	start_pos = position

func _process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity

	var direction := Input.get_axis("left", "right")

	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()


func _on_death_plane_body_entered(body: Node2D) -> void:
	body.position = start_pos
	velocity.y = 0


func _on_goal_body_entered(body: Node2D) -> void:

	if body == self:
		get_tree().change_scene_to_file("res://FirstGame/win_ui.tscn")
