extends Panel
class_name InventoryUISlot

@export var slot_data: InventorySlot
@onready var item_visual = $Sprite2D
var stored_data = null

func update(slot: InventorySlot):
	if !slot.item:
		$Label.hide()
	else:
		$Label.show()
		$Label.text = str(slot.amount)
		item_visual.position = Vector2(8, 8)
		item_visual.texture = slot.item.texture

func _get_drag_data(at_position: Vector2) -> Variant:
	set_drag_preview(make_drag_preview(at_position))
	return self


func make_drag_preview(at_position: Vector2) -> Control:
	var t := TextureRect.new()
	t.material = $Sprite2D.material
	t.texture = $Sprite2D.texture
	t.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	t.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	t.custom_minimum_size = size
	t.modulate.a = 0.5
	t.position = Vector2(-at_position)

	var c := Control.new()
	c.add_child(t)

	return c

func _can_drop_data(_at_position: Vector2, data: Variant):
	if data is InventoryUISlot:
		
		return true



# _at_position is not used because it doesn't matter where on the panel
# the item is dropped
func _drop_data(_at_position: Vector2, data: Variant):
	data.slot_data = slot_data
	slot_data = data.slot_data
	update(data.slot_data) 
