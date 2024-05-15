module main

import gg
import gx

fn main() {
	mut state := State.new()
	mut ctx := gg.new_context(
		bg_color: gx.rgb(20, 20, 20)
		width: 600
		height: 600
		window_title: 'snek'
	)
	ctx.config = gg.Config{
		...ctx.config
		frame_fn: get_frame_fn(mut state)
	}
	ctx.run()
}

fn get_frame_fn(mut s State) fn (mut gg.Context) {
	return fn [mut s] (mut ctx gg.Context) {
		s.tick()
		ctx.begin()
		s.draw(mut ctx)
		ctx.end()
	}
}
