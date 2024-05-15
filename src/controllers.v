module main

import gg

fn (mut sb SnakeBody) tick() {}

fn (mut s Snake) tick() {}

fn (mut a Apple) tick() {
	println('Apple.tick() - size: ${a.size}')
}

fn (mut s State) tick() {
	s.apple.tick()
	s.snake.tick()
}

fn (mut s State) run(mut ctx gg.Context) {
	ctx.run()
}
