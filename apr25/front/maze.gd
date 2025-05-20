@tool
extends TileMapLayer

var http_request: HTTPRequest 
@export var test_url: String = 'http://localhost:4020/maze?width=50&height=50&solved=true&json=true'
@export var fetch_new_maze: bool = false:
    set(value):
        if value:
            _fetch_new_maze(test_url)
    get:
        return false

func _fetch_new_maze(url: String):
    # If a request node already exists and is busy, you might want to
    # either cancel it, wait, or prevent a new request.
    if http_request:
        print('Another request is still processing, wait for it before re-running another one')
        return

    print('Try to fetch new maze')
    http_request = HTTPRequest.new()
    add_child(http_request) # The node must be in the scene tree to process
    http_request.request_completed.connect(_on_http_response_received)

    var response = http_request.request(url)
    if response != OK:
        printerr('Request error fetching new maze: ', response)
        http_request.queue_free()
        http_request = null

func _on_http_response_received(result: int, response_code: int, _headers: PackedStringArray, body: PackedByteArray):
    if result == HTTPRequest.RESULT_SUCCESS and response_code == 200:
        print('Maze data received')
        var data = JSON.parse_string(body.get_string_from_utf8())
        if data != null:
            print('Maze data parsed')
            
            # Set maze cells
            self.clear()
            for x in range(data['width']):
                for y in range(data['height']):
                    var code = data['renderedCellCodes'][y][x]
                    self.set_cell(Vector2i(x, y), 0, Vector2i(code[0], code[1]), 0)
        else:
            printerr('Could not parse maze data')
    else:
        printerr('Response error fetching new maze: ', result)

    if http_request:
        http_request.queue_free()
        http_request = null

# It's good practice to clean up if the node is removed from the editor scene
func _exit_tree():
    if http_request:
        http_request.queue_free()
        http_request = null
