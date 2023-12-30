extends KinematicBody2D

#variabel node
onready var character = $"."
onready var textlist = $CanvasLayer/itemlist
onready var textnotif = $CanvasLayer/itemlist/itemnotification
onready var timer = $CanvasLayer/itemlist/itemnotification/Timer
onready var sword = $sword
onready var shield = $shield

#variabel
var velocity = Vector2()
const speed = 60
const maxspeed = 600
const jump = -150
const gravity = 3
const up = Vector2(0, -1)
var itemlist = []

func _process(delta):
	# aplikasi gravitasi
	velocity.y += gravity
	
	#bergerak kiri
	if Input.is_action_pressed("kiri"):
		$AnimatedSprite.play("move")
		$AnimatedSprite.flip_h = true
		$sword.flip_h = true
		$sword.offset.x = -25
		$shield.flip_h = true
		$shield.offset.x = -12
		velocity.x -= min(speed * delta, maxspeed)
	#jika berhenti kiri, idle kiri
	elif Input.is_action_just_released("kiri"):
		$AnimatedSprite.play("idle")
		velocity.x = 0
	#bergerak kanan
	elif Input.is_action_pressed("kanan"):
		$AnimatedSprite.play("move")
		$AnimatedSprite.flip_h = false
		$sword.flip_h = false
		$sword.offset.x = 0
		$shield.flip_h = false
		$shield.offset.x = 0
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
	
	for items in itemlist:
		match items:
			"Stone Sword":
				sword.visible = true
			"Shield of the Tree":
				shield.visible = true
		pass

func _on_chestunder_pressed():
	itemlist.append("Stone Sword")
	displayitemnotif("Stone Sword")
	displayitemlist()
	pass


func _on_chesttree_pressed():
	itemlist.append("Shield of the Tree")
	displayitemnotif("Shield of the Tree")
	displayitemlist()
	pass

#menampilkan notifikasi barang
func displayitemnotif(item):
	textnotif.visible = true
	textnotif.text = item + " didapatkan."
	timer.start()
	pass

#menampilkan daftar barang
func displayitemlist():
	textlist.text = "Barang : \n"
	for items in itemlist:
		textlist.text += items + "\n"
	pass

#timer, jika waktu habis, menyembunyikan notifikasi
func _on_Timer_timeout():
	textnotif.visible = false
	pass


func _on_start_pressed():
	character.set_process_input(true)
	pass


func _on_knight_ready():
	character.set_process_input(false)
	pass # Replace with function body.
