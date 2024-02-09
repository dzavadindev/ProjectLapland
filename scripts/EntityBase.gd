extends RigidBody3D

@export_category("Characteristics")
@export var max_hp: int = 100
@export var hp: int = 100
@export var SPEED: int = 75

var velocity: Vector3 = Vector3.ZERO;

@onready var mesh = $Mesh
@onready var collision = $PhysicsCollider
@onready var anim_player = $AnimationPlayer
@onready var hibox = $HitBox

# events
func _process(delta): # per frame
	move(delta)

func _on_hit_box_body_entered(body): # when hit by anything
	take_damage(body)

# overridable functions
func move (_delta) :
	pass

func attack () :
	pass

func take_damage (body) :
	print(body)

func die () :
	pass
