extends RigidBody3D

var dash_avalible = true;
var dash_length = 2000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	var input := Vector3.ZERO
	input.x = Input.get_axis("move_left","move_right")
	input.z = Input.get_axis("move_forward","move_back")
	
	# Determines if player is able to dash at that momenent
	if (Input.get_action_strength("dash") && dash_avalible) :
		dash_avalible = false;
		$DashCooldown.start();
		apply_central_impulse(input * dash_length * delta)
	
	# Horizontal : recomended boost ratio is 5/7, 
	# everything else makes diagonal movement wanky 
	if (input.x != 0 && input.z != 0) :
		apply_central_force(input * 700.0 * delta)
	else :
		apply_central_force(input * 1000.0 * delta)
	

func _on_dash_cooldown_timeout():
	dash_avalible = true;

