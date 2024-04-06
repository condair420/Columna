extends Sprite2D

@export var item_data: ItemData
var area_name = null

func _process(_delta):
	texture = item_data.texture

func _on_area_2d_area_entered(area):
	if area.is_in_group("Picker"):
		area_name = area
		$AnimationPlayer.play("gone")

func _on_animation_player_animation_finished(_anim_name):
	area_name.get_parent().collect(item_data)
	queue_free()
