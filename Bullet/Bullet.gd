extends KinematicBody2D

var speed = 500


# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVariables.bulletInstanceCount += 1
	set_physics_process(true)



func _physics_process(delta):
#If bullet instance goes outside the screen view, delete it.
	if position.x < 10:
		queue_free()
	if position.x > 1280:
		queue_free()
		
		#bullets scale with the player, but if they die while shrunk the bullets stay small.
	if GlobalVariables.playerSize == Vector2(0.3, 0.3):
		self.scale = Vector2(0.3, 0.3)
	elif GlobalVariables.playerSize == Vector2(1, 1):
		self.scale = Vector2(1, 1)
	var collidedObject = move_and_collide(Vector2(0, -speed*delta))
	
	#if an enemy collides with the bullet, delete the bullet.
	if (collidedObject):
			print(collidedObject .collider.name)
			if "Enemy" in collidedObject.collider.name:
				collidedObject.get_collider().queue_free()
				GlobalVariables.scoringInformation["currentScore"] +=10
			queue_free()
			GlobalVariables.bulletInstanceCount -= 1
	if GlobalVariables.Player == null:
		queue_free()



