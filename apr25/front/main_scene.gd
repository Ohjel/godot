extends Node2D

var time_elapsed: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
    $Control/Label.modulate = Color.GREEN_YELLOW

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    time_elapsed += delta
    $Control/Label.text = 'Time elapsed: ' + str(roundf(time_elapsed)) + 's'
