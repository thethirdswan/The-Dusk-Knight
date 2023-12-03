extends Area2D

onready var chestunder = $chestunder
onready var chesttree = $chesttree

#jika karakter masuk area peti, akan menunjukkan tombol untuk membuka peti yang bersangkutan

#peti bawah tanah
func _on_chest1_body_entered(_body):
	chestunder.visible = true
	chestunder.disabled = false
	pass

func _on_chest1_body_exited(_body):
	chestunder.visible = false
	chestunder.disabled = true
	pass


#peti diatas pohon
func _on_chest2_body_entered(_body):
	chesttree.visible = true
	chesttree.disabled = false
	pass

func _on_chest2_body_exited(_body):
	chesttree.visible = false
	chesttree.disabled = true
	pass

