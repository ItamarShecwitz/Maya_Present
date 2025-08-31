extends Node2D
@onready var progress_bar: ProgressBar = $CanvasLayer/ProgressBar

var PACKS = 5
var SITE = "https://itamarshecwitz.github.io/HappyBirthdayMaya/"
var packs_loaded = 0

func download_file(url: String, pack_num: String):
	# Create an HTTPRequest node
	var http_request = HTTPRequest.new()
	add_child(http_request)

	# Connect the request_completed signal
	http_request.request_completed.connect(func(result: int, response_code: int, headers: Array, body: PackedByteArray, pack = pack_num):_on_request_completed(result, response_code, headers, body, pack))
	
	# Start the HTTP request
	var error = http_request.request(url)
	if error != OK:
		print("Failed to initiate request: ", error)

# Signal callback for handling the HTTP request completion
func _on_request_completed(result: int, response_code: int, headers: Array, body: PackedByteArray, pack: String):
	print(pack)
	if response_code == 200:  # HTTP 200 OK
		var file = FileAccess.open("res://pics" + str(pack) + ".pck", FileAccess.WRITE)
		if file:
			file.store_buffer(body)
			file.close()
			print("File downloaded")
		else:
			print("Failed to create or write to the file.")
	else:
		print("Failed to download the file. HTTP response code: ", response_code)
		
	ProjectSettings.load_resource_pack("res://pics" + str(pack) + ".pck")

	progress_bar.value += 20
	packs_loaded += 1
	if packs_loaded >= 5:
		start_game()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(PACKS):
		download_file(SITE +"pics" + str(i) + ".pck", str(i))

func start_game():
	print("starting game")
	var loading_scene = load("res://main_scene.tscn")
	get_tree().change_scene_to_packed(loading_scene)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
