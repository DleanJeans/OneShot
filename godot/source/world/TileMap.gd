extends Node2D

signal drawn

export(float) var tilemap_width = 10
export(float) var tilemap_height = 10
export(Color) var line_color = Color("3f000000")
export(Color) var map_color = Color("12ac4a")

var map_size setget , get_map_size
func get_map_size():
	return Vector2(tilemap_height, tilemap_height) * scale

var rect

func _draw():
	draw_set_transform(Vector2(-5, -5), 0, Vector2(1, 1))
	
	var half_width = tilemap_width * 0.5
	var half_height = tilemap_height * 0.5
	
	for y in range(0, tilemap_height + 1):
		var from = Vector2(0, y)
		var to = Vector2(tilemap_width, y)
		draw_line(from, to, line_color)
	
	for x in range(0, tilemap_width + 1):
		var from = Vector2(x, 0) 
		var to = Vector2(x, tilemap_height)
		draw_line(from, to, line_color)
	
	rect = Rect2().grow(scale.x * tilemap_width * 0.5)
	
	emit_signal("drawn")