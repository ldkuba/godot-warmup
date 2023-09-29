extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -200.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var tex_standing = load("res://assets/sprites/Pixel Platformer/Characters/character_0000.png")
var tex_jumping = load("res://assets/sprites/Pixel Platformer/Characters/character_0001.png")

var looking_left: bool
var sprite_looking_left: bool
	
@export var player_sounds: SoundManager

func play_coin_sound():
	player_sounds.play_sound("coin")

func _physics_process(delta):
	if looking_left:
		$Sprite.scale = Vector2(1, 1)
	else:
		$Sprite.scale = Vector2(-1, 1)
			
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		$Sprite.texture = tex_standing

	# Handle Jump.
	if Input.is_action_just_pressed("player_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$Sprite.texture = tex_jumping
		player_sounds.play_sound("jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("player_left", "player_right")
	if direction != 0:
		looking_left = direction < 0
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if velocity.x != 0:
		player_sounds.play_sound("footsteps")

	move_and_slide()
