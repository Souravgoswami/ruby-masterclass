#!/usr/bin/ruby -w
%w(ruby2d open3).each { |el| require(el) }

WIDTH = 1280
HEIGHT = 720
FPS = 120
SIZE = 300
PARTICLES = 1_200
FROZEN_PARTICLES = 100
TITLE = 'Ruby 2D'
BORDER = true

define_method(:main) do |width = 640, height = 480, fps = 60, size = 100, particle = 500, frozen_particle = 100, title = 'Ruby 2D', border = true|
	@width, @height, @size, @fullscreen = width, height, size, ARGV.find { |a| a =~ /[0-9]/ }.to_i
	set width: @width, height: @height, fps_cap: fps, resizable: true, title: title, background: '#000000', fullscreen: @fullscreen.odd?, borderless: not(border)
	selected_pattern = 0

	particles_op, div, op2 = PARTICLES * 200.0, PARTICLES / 3.0, PARTICLES * 4.0

	particles = Array.new(particle) { Square.new(size: rand(1..3), x: rand(@width), y: rand(@height), color: [rand, rand, rand, 1]) }.freeze
	particles.each { |x| x.size = 0 }
	j = 0

	patterns = [
		'
			particles.each_with_index do |o, i|
				o.y += i / (particle / 2.0)
				o.x, o.y, o.size, o.color = rand(@width), 0, rand(1..3), [rand, rand, rand, 1] if o.y > @height + o.height
			end
		',

		'
			particles.each_with_index do |o, i|
				o.x, o.y, o.opacity = o.x + Math.cos(i) * i / div, o.y + Math.sin(i) * i / div, o.opacity - i / particles_op
				o.size = o.size.send((o.size >= 2 ? :- : :+), 0.1)
				o.color = [rand, rand, rand, o.opacity]
				o.x, o.y, o.size, o.opacity = WIDTH / 2, HEIGHT / 2, 0.1, 1 unless o.opacity > 0
			end
		',

		'
			particles.each_with_index do |o, i|
				o.x, o.y, o.opacity = o.x + Math.cos(i) * i / div, o.y + Math.sin(i) * i / div, o.opacity - i / particles_op
				o.size = o.size.send(o.size >= 2 ? :- : :+, 0.1)
				o.x, o.y, o.size, o.color = WIDTH / 2, HEIGHT / 2, 0.1, [rand, rand, rand, 1] unless o.opacity > 0
			end
		',

		'
			particles.each_with_index do |o, i|
				o.x, o.y, o.opacity = o.x + Math.cos(i) * i / div, o.y + Math.sin(i) * i / div, o.opacity - i / particles_op
				o.size = o.size.send((o.size >= 2 ? :- : :+), 0.1)
				o.g += 0.025
				o.b -= 0.0025
				o.r += i / 100.0
				o.x, o.y, o.size, o.color = WIDTH / 2, HEIGHT / 2, 0.1, [0, 0, 1, 1] unless o.opacity > 0
			end
		',

		'
			j += 0.000025
			particles.each_with_index do |o, i|
				o.x = Math.sin(i * j) * @width / 2.0 + @width / 2
				o.y = Math.tan(i) * @height / 8.0 + @height / 2
				o.size = 2
				o.color = [rand, rand, rand, 1]
			end
		'
	].freeze

	frozen_particle.times { Square.new(size: rand(1..3), x: rand(@width), y: rand(@height), color: [rand, rand, rand, 1]) }

	quad = Quad.new(
		x1: @width / 2 - @size / 2, y1: @height / 2 - @size / 4,
		x2: @width / 2 + -@size / 4, y2: @height / 2 - @size / 2,
		x3: @width / 2 + @size / 4, y3: @height / 2 - @size / 2,
		x4: @width / 2 + @size / 2, y4: @height / 2 - @size / 4,
		color: %w(#F74F4C #F74F4C #F74F4C #F74F4C)
	)

	(1..4).each { |el| binding.eval %Q{@x#{el}, @y#{el} = quad.x#{el}, quad.y#{el}} }
	centre = quad.x1.+(quad.x4)./(2)

	base = Triangle.new(
		color: '#E73834',
		x1: centre, x2: @x4, x3: @x1,
		y1: size + @y1 / 1.5, y2: @y1, y3: @y1
	)

	right_base = Triangle.new(
		color: '#F64542', z: 1, opacity: 1,
		x3: @x1, x1: centre, x2: @x2,
		y1: base.y1, y2: base.y2, y3: base.y3,
	)

	left_base = Triangle.new(
		color: '#D83431', z: 1, opacity: 1,
		x2: @x4, x1: centre, x3: @x3,
		y1: base.y1, y2: base.y2, y3: base.y3,
	)

	top1 = Triangle.new(
		color: '#EE3A36', z: 1, opacity: 1,
		x1: right_base.x2, x2: right_base.x1, x3: right_base.x2,
		y1: right_base.y2, y2: @y2, y3: @y2
	)

	top2 = Triangle.new(
		color: '#EE3A36', z: 1, opacity: 1,
		x1: left_base.x3, x2: left_base.x3, x3: top1.x2,
		y1: left_base.y2, y2: @y2, y3: @y3
	)

	change_size = proc do |op|
		if op
			quad.x1, quad.x2 = quad.x1.send(op, -2), quad.x2.send(op, -1)
			quad.x3, quad.x4 = quad.x3.send(op, 1), quad.x4.send(op, 2)
			quad.y1, quad.y2 = quad.y1.send(op, 1), quad.y2.send(op, -1)
			quad.y3, quad.y4 = quad.y3.send(op, -1), quad.y4.send(op, 1)

			(1..4).each { |el| binding.eval %Q{@x#{el}, @y#{el} = quad.x#{el}, quad.y#{el}} }
			centre = quad.x1.+(quad.x4)./(2)

			base.x1, base.x2, base.x3 = centre, @x4, @x1
			base.y1, base.y2, base.y3 = (@x4 - @x1) + @y1 / 1.5, @y1, @y1

			right_base.x1, right_base.x2, right_base.x3 = centre, @x2, @x1
			right_base.y1, right_base.y2, right_base.y3 = base.y1, base.y2, base.y3

			left_base.x1, left_base.x2, left_base.x3 = centre, @x4, @x3
			left_base.y1, left_base.y2, left_base.y3 = base.y1, base.y2, base.y3

			top1.x1, top1.x2, top1.x3 = right_base.x2, right_base.x1, right_base.x2
			top1.y1, top1.y2, top1.y3 = right_base.y2, @y2, @y2

			top2.x1, top2.x2, top2.x3 = left_base.x3, left_base.x3, top1.x2
			top2.y1, top2.y2, top2.y3 = left_base.y2, @y2, @y3
		end
	end

	ruby = [quad, base, right_base, left_base, top1, top2]

	on(:mouse_scroll) { |e| change_size.(e.delta_y == -1 ? :+ : :-) }

	on :key_held do |k|
		change_size.(
			if k.key == 'up' then :+
			elsif k.key == 'down' then :-
			end
		)
	end

	on :key_down do |k|

		case k.key
			when 'f11' then close if Open3.pipeline_start("#{File.join(RbConfig::CONFIG['bindir'], 'ruby')} #{File.join(__FILE__)} #{@fullscreen += 1}")
			when 'escape' then close
			when 'printscreen' then Window.screenshot
			when 'right' then selected_pattern = selected_pattern.+(1).%(patterns.size)
			when 'left' then selected_pattern = selected_pattern.-(1).%(patterns.size)
			when 's' then particles.each { |x| x.x, x.y, x.color = rand(@width), rand(@height), [rand, rand, rand, 1] }
			when '-' then ruby.each { |x| x.opacity -= 0.1 if x.opacity > 0 }
			when '=' then ruby.each { |x| x.opacity += 0.1 if x.opacity < 1 }
		end
	end

	update { binding.eval(patterns[selected_pattern]) }
end

main(WIDTH, HEIGHT, FPS, SIZE, PARTICLES, FROZEN_PARTICLES, TITLE, BORDER)
show
