#!/usr/bin/ruby -w
require('ruby2d')

# Ensure garbage collection is enabled to prevent infinite memory usage!
GC.start(full_mark: true, immediate_sweep: true)

PATH = File.dirname(__FILE__)
GRID_SIZE = 20
GRID_WIDTH = Window.width / GRID_SIZE
GRID_HEIGHT = Window.height / GRID_SIZE
FONT = File.join(PATH, %w(Assets Font GenBasB.ttf))

@music = Music.new(File.join(PATH, %w(Assets Sounds 371148__mrthenoronha__cool-game-theme-loop.wav)), loop: true)
@welcome_sound, @welcome_sound_not_playing = Music.new(File.join(PATH, %w(Assets Sounds 388079__xsgianni__mario-s-way.mp3))), false
@explode = Sound.new(File.join(PATH, %w(Assets Sounds 382310__myfox14__game-over-arcade.wav)))
@eaten_ball_music = Sound.new(File.join(PATH, %w(Assets Sounds 320654__rhodesmas__level-up-02.wav)))
@game_over_music = Sound.new(File.join(PATH, %w(Assets Sounds 413641__djlprojects__metal-gear-solid-inspired-alert-surprise-sfx.wav)))
@welcome_sound.play

@width, @height, @fps = 640, 480, 15
set width: @width, height: @height, background: '#000000', fps_cap: @fps

class Snake
	attr_accessor(:direction, :lives)
	@@width, @@height = Window.width, Window.height

	define_method(:reset) do
		@positions.replace(Array.new(4) { |i| [GRID_SIZE, i * GRID_SIZE] })
		@direction, @growing, @lives = 'down', 'false', 1
	end

	def move
		@growing ? (@growing = false) : @positions.shift
		@positions.push(next_position)
		self
	end

	def movable?(new_direction)
		case @direction
			when 'up' then new_direction != 'down'
			when 'down' then new_direction != 'up'
			when 'left' then new_direction != 'right'
			when 'right' then new_direction != 'left'
		end
	end

	def next_position
		case @direction
			when 'down' then new_coords(x, y + GRID_SIZE)
			when 'up' then new_coords(x, y - GRID_SIZE)
			when 'right' then new_coords(x + GRID_SIZE, y)
			when 'left' then new_coords(x - GRID_SIZE, y)
		end
	end

	define_method(:initialize) { @positions, @direction, @growing, @lives = Array.new(4) { |i| [GRID_SIZE, i * GRID_SIZE] }, 'down', false, 1 }
	define_method(:draw) { @positions.each { |p| Square.new(x: p[0], y: p[1], size: GRID_SIZE - 1, color: '#FFFFFF') } }
	define_method(:x) { @positions[-1][0] }
	define_method(:y) { @positions[-1][-1] }
	define_method(:grow) { @growing = true }
	define_method(:collided?) { (@positions = @positions.uniq) && (return true) if @positions.uniq != @positions }
	define_method(:new_coords) { |x, y| [x % (GRID_WIDTH * GRID_SIZE), (y.%(@@height.-(GRID_SIZE)))] }

	protected(:new_coords)
end

class Ball
	attr_accessor(:x, :y)
	define_method(:initialize) { @x, @y, @score, @finished = 0, GRID_SIZE, 0, false }
	define_method(:draw) { |op| @ball = Square.new(x: @x, y: @y, size: GRID_SIZE - 1, color: '#FFFF00', z: 3, opacity: op ? 0 : 1) }
	define_method(:eaten?) { |snake| @ball.contains?(snake.x, snake.y) }

	def shuffle(x = rand(Window.width / GRID_SIZE), y = rand(Window.height / GRID_SIZE - 2))
		@x, @y = x * GRID_SIZE, y * GRID_SIZE
		self
	end
end

snake, ball, score, streak, eaten, i, o, game_over, collided = Snake.new, Ball.new.shuffle, 0, 0, 0, 0, 0, true, true

on :key_down do |k|
	snake.direction = k.key if snake.movable?(k.key) if k.key =~ /^(up|down|right|left)+$/
	close if k.key == 'escape'

	if k.key == 'space' && game_over
		@game_over_music.play
		@welcome_sound.stop
		snake.reset
		ball.shuffle
		game_over = false
		@music.play
	end
end

update do
	i += 1
	Window.clear
	300.times { |c| Square.new(size: rand(1..2), x: Math.cos(c) * @width / 2.0 + @width / 2.0, y: c * @height / 300.0, z: 10, color: '#FFFFFF') }
	Rectangle.new(color: %w(#FFA230 #4FDB50 #0174FF #F10EF8), width: @width, height: @height, z: -1)
	ball.draw(i % (@fps / 4) == 0)

	unless game_over
		snake.move.draw

		if ball.eaten?(snake)
			@eaten_ball_music.play
			streak, eaten = streak + 1, eaten + 1
			score +=  streak
			snake.lives += 1 if eaten % 5 == 0
			ball.shuffle
			snake.grow
		end

		if snake.collided?
			(game_over = @welcome_sound_not_playing = true) && @music.stop if snake.lives <= 0
			(collided = true) && @explode.play unless collided
			snake.lives -= 1
		else
			collided = false
		end

		o = 0 unless o == 0
	else
		o += 0.05 if o < 0.5
		Rectangle.new(color: '#000000', opacity: o, z: 10, width: @width, height: @height)
		g_ovr = Text.new('Press Space to Start', font: FONT, z: 100, size: 40)
		g_ovr.x, g_ovr.y = @width / 2 - g_ovr.width / 2, @height / 2 - g_ovr.height / 2

		snake.direction = if snake.y > ball.y || snake.y < ball.y then 'down'
			elsif snake.x > ball.x then 'left'
			elsif snake.x < ball.x then 'right'
		end

		snake.movable?(snake.direction) ? snake.move.draw : ((snake.direction = %w(up down left right).sample) && snake.move)
		ball.shuffle if ball.eaten?(snake)

		if @welcome_sound_not_playing
			@welcome_sound_not_playing = false
			@welcome_sound.play
		end
	end

	Line.new(color: '#FFFFFF', x1: 0, x2: @width, y1: @height - GRID_HEIGHT + 3, y2: @height - GRID_HEIGHT + 3, z: 2, width: 1)
	Line.new(color: '#000000', x1: 0, x2: @width, y1: @height - GRID_HEIGHT + 2, y2: @height - GRID_HEIGHT + 2, z: 2, width: 1)
	s = Text.new("Score: #{score} | Lives: #{snake.lives < 0 ? 0 : snake.lives} | Eaten: #{eaten}", font: FONT, z: 2)
	s.x, s.y = @width - s.width - 10, @height - s.height
end

show
