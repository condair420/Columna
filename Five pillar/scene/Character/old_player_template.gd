extends CharacterBody2D

@export var speed = 250
@export var acceleration = 2000
@export var friction = 900

var input = Vector2.ZERO
var usable = true

func get_input():
	input = Input.get_vector("left", "right", "up", "down")
	return input.normalized()

func _physics_process(delta):
	get_input()
	
	if get_input() == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			$AnimationPlayer.play("idle")
			velocity = Vector2.ZERO
	else:
		$AnimationPlayer.play("walk")
		velocity += (get_input() * acceleration * delta)
		velocity = velocity.limit_length(speed)
	
	move_and_slide()



func _process(delta):
	var global_mouse_position = get_global_mouse_position()
	
	if Input.is_action_just_pressed("action") and usable == true:
		fire()
		$Timer.start()
		usable = false
	
	if velocity.x < 0:
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.flip_h = false
	

func fire():
	var bullet = preload("res://scene/Mechanism/projectile.tscn").instantiate()
	
	var current_position = position
	bullet.dir = get_global_mouse_position() - current_position
	
	add_child(bullet)
	bullet.reparent(get_parent())
	
	bullet.look_at(get_global_mouse_position())
	
	

func _on_timer_timeout():
	usable = true

