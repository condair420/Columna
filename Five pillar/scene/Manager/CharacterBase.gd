extends CharacterBody2D
class_name CharacterBase

@export var sprite : Sprite2D
@export var flipped_horizontal : bool
@export var SpriteScale : int

func _process(_delta):
	Turn()

func Turn():
	#This ternary lets us flip a sprite if its drawn the wrong way
	var direction = -1 if flipped_horizontal == true else 1
	
	if(velocity.x < 0):
		sprite.scale.x = -direction * SpriteScale
	elif(velocity.x > 0):
		sprite.scale.x = direction * SpriteScale
