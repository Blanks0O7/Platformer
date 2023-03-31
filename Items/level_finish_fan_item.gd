extends Area2D

@onready var door = $Door
@onready var key_item = $KeyItem

func _ready():
	$CollisionShape2D.connect("body_entered", on_key_collected(), _on_KeyItem_body_entered(body))
	# Get the integer ID of the "key_collected" signal
	var signal_id = key_item.get_signal("key_collected")
	# Connect the signal to the "on_key_collected" method
	$KeyItem.connect(signal_id, self, "on_key_collected")

func _on_KeyItem_body_entered(body):
	if body.is_in_group("Player"):
		# Hide the key item
		key_item.visible = false
		# Emit a signal to indicate that the key has been collected
		key_item.emit_signal("key_collected")

func on_key_collected():
	# Open the door here
	pass
