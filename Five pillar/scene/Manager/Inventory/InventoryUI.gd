extends Control

@onready var inv: SaveData = preload("res://Save_1.tres")
@onready var slots: Array = $PanelContainer/GridContainer.get_children()

func _ready():
	inv.update.connect(update_slots)
	update_slots()

func update_slots():
	for i in range(min(inv.slots.size(), slots.size())):
		slots[i].slot_data = inv.slots[i]
		slots[i].update(inv.slots[i])
