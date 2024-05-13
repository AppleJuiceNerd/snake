module main

// import rand
import gg
import gx

// Structures
struct Snake {
mut:
	body []SnakeBody  @[required]
	direction u8
}

struct SnakeBody {
mut:
	position   Point  @[required]
	size       f32
	connectors u8
}

struct Apple {
mut:
	position Point  @[required]
	size     f32 = 30
}

struct State {
mut:
	snake   Snake
	apple   Apple
	context gg.Context
	size    f32 = 30
}

// State Functions
fn State.new() State {
	mut state := State{
		context: gg.new_context(
			bg_color: gx.rgb(20, 20, 20)
			width: 600
			height: 600
			window_title: 'snek'
		)
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
	state.context.config = gg.Config{
		...state.context.config
		frame_fn: state.frame
	}
	println(state.apple.size)
	return state
}

fn (mut s State) draw(mut ctx gg.Context) {
	s.apple.draw(mut ctx)
	s.snake.draw(mut ctx)
}

fn (mut s State) tick() {
	s.apple.tick()
	s.snake.tick()
}

fn (mut s State) frame(mut ctx gg.Context) {
	s.tick()
	ctx.begin()
	s.draw(mut ctx)
	ctx.end()
}

fn (mut s State) run() {
	s.context.run()
}

// Apple Functions
fn (mut a Apple) draw(mut ctx gg.Context) {
	println(a.size)
	ctx.draw_square_filled(
		a.position.x * a.size,
		a.position.y * a.size,
		a.size, gx.rgb(255, 50, 50)
	)
}

fn (mut a Apple) tick() {
}

// Snake Functions
fn (mut s SnakeBody) draw(mut ctx gg.Context) {
	ctx.draw_square_filled(s.position.x, s.position.y, s.size, gx.rgb(50, 255, 50))
}

fn (mut s SnakeBody) tick() {
}

fn (mut s Snake) draw(mut ctx gg.Context) {
	for mut part in s.body {
		part.draw(mut ctx)
	}
}

fn (mut s Snake) tick() {
}
