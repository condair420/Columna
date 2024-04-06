extends CharacterBase
class_name PlayerMain

@export var save_data: SaveData

func collect(item):
	save_data.insert(item)
