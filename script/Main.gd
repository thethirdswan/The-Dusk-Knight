extends Control

#inisialisasi variabel node
onready var tilemap = $TileMap
onready var buttonunder = $chest1/chestunder
onready var buttontree = $chest2/chesttree
onready var gameover = $Knight/CanvasLayer/gameover
onready var gameoverbutton = $Knight/CanvasLayer/gameover/Panel/gameoverbutton

var openchest = 31

#saat tombol buka peti bawah tanah ditekan, tileset peti diubah, menambahkan item ke array itemlist
func _on_chestunder_pressed():
	tilemap.set_cell(57, 34, openchest)
	pass

#saat tombol buka peti atas pohon ditekan, tileset peti diubah, menambahkan item ke array itemlist
func _on_chesttree_pressed():
	tilemap.set_cell(30, 20, openchest)
	pass

#untuk mengecek kedua peti
func _process(delta):
	#jika peti telah dibuka, tombol buka tidak bisa ditekan lagi
	if (tilemap.get_cell(57, 34) == openchest):
		buttonunder.disabled = true
	
	if (tilemap.get_cell(30, 20) == openchest):
		buttontree.disabled = true
		
	pass

func _on_fallarea_body_entered(body):
	gameover.visible = true
	gameoverbutton.disabled = false
	pass

func _on_gameoverbutton_pressed():
	gameover.visible = false
	gameoverbutton.disabled = true
	get_tree().reload_current_scene()
	pass
