extends Barrel


func _ready() -> void:
	super()
	Global.chests_left += 1


func explode(multiplier: int) -> void:
	Global.chests_left -= 1
	super(multiplier)