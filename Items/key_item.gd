extends Area2D

signal key_collected
var copter = load("res://Items/level_finish_fan_item.tscn")




func _on_CollisionShape2D_body_entered(body):
	if body.is_in_group("Player"):
		# Hide the key item
		visible = false
		# Emit a signal to indicate that the key has been collected
		emit_signal("key_collected")


func _on_key_collected():
	copter.visible = true
