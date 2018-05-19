extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	pass

func _input(event):
	var rotSpeed = 0.01
	if event is InputEventMouseMotion:
		var rx = -rotSpeed * event.relative.y
		var ry = -rotSpeed * event.relative.x
		$Camera.rotate_x(rx)
		self.rotate_y(ry)
	pass

func _process(delta):
	var speed = 0.1
	var move = Vector3(0,0,0)
	if Input.is_action_pressed("faster"):
		speed = 0.3
	if Input.is_action_pressed("move_forwards"):
		move.z -= speed
	if Input.is_action_pressed("move_backwards"):
		move.z += speed
	if Input.is_action_pressed("move_left"):
		move.x -= speed
	if Input.is_action_pressed("move_right"):
		move.x += speed

	var glob = $Camera.global_transform.basis.xform(move)
	self.global_translate(glob)
	pass
