extends Node2D
var PACKS = 5
var SITE = "http://localhost:8000/"
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
	print("nowNOWNOWNOIW")

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
		
	var success = ProjectSettings.load_resource_pack("res://pics" + str(pack) + ".pck")


	packs_loaded += 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
