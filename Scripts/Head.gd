class_name Head extends Snake_part

signal food_eaten

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group('food'):
		food_eaten.emit()
		area.call_deferred('queue_free')
