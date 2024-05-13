module main

fn main() {
	mut game := State.new()
	println(game.apple)
	game.run()
}
