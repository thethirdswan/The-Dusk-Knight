extends KinematicBody2D

#variabel
var velocity = Vector2()
const speed = 60
const maxspeed = 600
const jump = -150
const gravity = 3
const up = Vector2(0, -1)

func _process(delta):
	# aplikasi gravitasi
	velocity.y += gravity
	
	#bergerak kiri
	if Input.is_action_pressed("kiri"):
		$AnimatedSprite.play("move")
		$AnimatedSprite.flip_h = true
		velocity.x -= min(speed * delta, maxspeed)
	#jika berhenti kiri, idle kiri
	elif Input.is_action_just_released("kiri"):
		$AnimatedSprite.play("idle")
		velocity.x = 0
	#bergerak kanan
	elif Input.is_action_pressed("kanan"):
		$AnimatedSprite.play("move")
		$AnimatedSprite.flip_h = false
		velocity.x += min(speed * delta, maxspeed)
	#jika berhenti kanan, idle kanan
	elif Input.is_action_just_released("kanan"):
		$AnimatedSprite.play("idle")
		velocity.x = 0
	
	#melakukan lompat
	if Input.is_action_just_pressed("lompat"):
		if (is_on_floor() == true):
			velocity.y = jump
		else:
			pass

	#untuk menggerakkan karakter
	velocity = move_and_slide(velocity, up)
