module main

import gg
import gx

fn (mut sb SnakeBody) draw(mut ctx gg.Context) {
	ctx.draw_square_filled(sb.position.x, sb.position.y, sb.size, gx.rgb(50, 255, 50))
}

fn (mut s Snake) draw(mut ctx gg.Context) {
	for mut part in s.body {
		part.draw(mut ctx)
	}
}

fn (mut a Apple) draw(mut ctx gg.Context) {
	ctx.draw_square_filled(a.position.x * a.size, a.position.y * a.size, a.size, gx.rgb(255,
		50, 50))
}

fn (mut s State) draw(mut ctx gg.Context) {
	s.apple.draw(mut ctx)
	s.snake.draw(mut ctx)
}
