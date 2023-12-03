extends Area2D

onready var signtext = $signtext/Label

#jika karakter masuk ke Area2D, tampilkan tulisan
func _on_Area2D_body_entered(_body):
	signtext.visible = true
	pass # Replace with function body.

#jika karakter keluar dari Area2D, sembunyikan tulisan
func _on_Area2D_body_exited(_body):
	signtext.visible = false
	pass # Replace with function body.
