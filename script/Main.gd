extends Control

#inisialisasi variabel node
onready var tilemap = $TileMap
onready var textlist = $CanvasLayer/itemlist
onready var textnotif = $CanvasLayer/itemlist/itemnotification
onready var timer = $CanvasLayer/itemlist/itemnotification/Timer
onready var buttonunder = $chest1/chestunder
onready var buttontree = $chest2/chesttree
onready var gameover = $CanvasLayer/gameover
onready var gameoverbutton = $CanvasLayer/gameover/Panel/gameoverbutton

var openchest = 31
var itemlist = []

#saat tombol buka peti bawah tanah ditekan, tileset peti diubah, menambahkan item ke array itemlist
func _on_chestunder_pressed():
	tilemap.set_cell(57, 34, openchest)
	itemlist.append("Stone Sword")
	displayitemnotif("Stone Sword")
	displayitemlist()
	pass

#saat tombol buka peti atas pohon ditekan, tileset peti diubah, menambahkan item ke array itemlist
func _on_chesttree_pressed():
	tilemap.set_cell(30, 20, openchest)
	itemlist.append("Shield of the Tree")
	displayitemnotif("Shield of the Tree")
	displayitemlist()
	pass

#untuk mengecek kedua peti
func _process(delta):
	#jika peti telah dibuka, tombol buka tidak bisa ditekan lagi
	if (tilemap.get_cell(57, 34) == openchest):
		buttonunder.disabled = true
	
	if (tilemap.get_cell(30, 20) == openchest):
		buttontree.disabled = true
		
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

#timer, jika waktu habis, menyembunyikan notif barang
func _on_Timer_timeout():
	textnotif.visible = false
	pass # Replace with function body.



func _on_fallarea_body_entered(body):
	gameover.visible = true
	gameoverbutton.disabled = false
	pass


func _on_gameoverbutton_pressed():
	gameover.visible = false
	gameoverbutton.disabled = true
	get_tree().reload_current_scene()
	pass


func _on_start_pressed():

	pass # Replace with function body.
