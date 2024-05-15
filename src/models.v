module main

struct Point {
	x int
	y int
}

struct SnakeBody {
mut:
	position   Point @[required]
	size       f32
	connectors u8
}

struct Snake {
mut:
	body      []SnakeBody @[required]
	direction u8
}

struct Apple {
mut:
	position Point @[required]
	size     f32 = 30
}

struct State {
mut:
	snake Snake
	apple Apple
	size  f32 = 30
}

fn State.new() State {
	mut instance := State{
		apple: Apple{
			position: Point{1, 1}
		}
		snake: Snake{
			body: [
				SnakeBody{
					position: Point{4, 4}
				},
			]
		}
	}
	return instance
}
