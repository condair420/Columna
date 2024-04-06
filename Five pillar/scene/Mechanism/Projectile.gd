extends Area2D

var usable = true
var dir = Vector2.ZERO
var speed = 600

func _process(delta):
	translate(dir.normalized() * delta * speed)




func _on_area_entered(area):
	if area.is_in_group("enemy"):
		usable = false
