extends "res://scripts/EntityBase.gd"

var dash_avalible = true;
var DASH_LENGTH = 2000

func _process(delta):
	super(delta)
	if (Input.get_action_strength("quit")) :
		get_tree().quit()

func move (delta) :
	var input := Vector3.ZERO
	input.x = Input.get_axis("move_left","move_right")
	input.z = Input.get_axis("move_forward","move_back")
	
	# Determines if player is able to dash at that momenent
	if (Input.get_action_strength("dash") && dash_avalible) :
		dash_avalible = false;
		$DashCooldown.start();
		apply_central_impulse(input * DASH_LENGTH * delta)
	
	# Horizontal : recomended boost ratio is 5/7, 
	# everything else makes diagonal movement wanky 
	if (input.x != 0 && input.z != 0) :
		apply_central_force(input * SPEED * delta)
	else :
		apply_central_force(input * (SPEED - 300) * delta)

func _on_dash_cooldown_timeout():
	dash_avalible = true;
