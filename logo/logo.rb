#!/usr/bin/ruby -w
%w(ruby2d securerandom open3).each { |el| require(el) }

WIDTH = 1280
HEIGHT = 720
FPS = 120
SIZE = 300
PARTICLES = 500
FROZEN_PARTICLES = 100
TITLE = 'Ruby 2D'

define_method(:main) do |width = 640, height = 480, fps = 60, size = 100, particle = 500, frozen_particle = 100, title|
	@width, @height, @size, @fullscreen = width, height, size, ARGV.find { |a| a =~ /[0-9]/ }.to_i
	set width: @width, height: @height, fps_cap: fps, resizable: true, title: title, background: '#000000', fullscreen: @fullscreen.odd?

	frozen_particle.times { Square.new(size: rand(1..3), x: rand(@width), y: rand(@height), color: "##{SecureRandom.hex(3)}") }
	particles = Array.new(particle) { Square.new(size: rand(1..3), x: rand(@width), y: rand(@height), color: "##{SecureRandom.hex(3)}") }.freeze

	quad = Quad.new(
		x1: @width / 2 - @size / 2, y1: @height / 2 - @size / 4,
		x2: @width / 2 + -@size / 4, y2: @height / 2 - @size / 2,
		x3: @width / 2 + @size / 4, y3: @height / 2 - @size / 2,
		x4: @width / 2 + @size / 2, y4: @height / 2 - @size / 4,
		color: %w(#DA3337 #FF00FF #FF00FF #DA3337)
	)

	(1..4).each { |el| eval %Q{@x#{el}, @y#{el} = quad.x#{el}, quad.y#{el}} }
	centre = quad.x1.+(quad.x4)./(2)

	base = Triangle.new(
		color: '#DA3337',
		x1: centre, x2: @x4, x3:@x1,
		y1: @y1 + @size / 1.5, y2: @y1, y3: @y1
	)

	right_base = Triangle.new(
		color: %w(#FF0000 #FFFF00 #FF00FF), z: 1, opacity: 1,
		x1: (@x1 + centre) / 2, x2: @x1, x3: centre,
		y1: (base.y1 + base.y2) / 2, y2: base.y2, y3: base.y3,
	)

	left_base = Triangle.new(
		color: %w(#FFFFFF #3CE3B4 #FF00FF),
		x1: (centre + @x4) / 2, x2: centre, x3: @x4,
		y1: (base.y1 + base.y2) / 2, y2: base.y2, y3: base.y3
	)

	centre_base = Triangle.new(
		color: %w(#FFFF00 #FFFFFF #FF00FF),
		x1: right_base.x1, x2: left_base.x1, x3: centre,
		y1: right_base.y1, y2: right_base.y1, y3: right_base.y2
	)

	Triangle.new(
		color: %w(#FF0000 #FF00FF #FFFFFF), z: 1, opacity: 1,
		x1: right_base.x1, x2: left_base.x1, x3: centre,
		y1: centre_base.y1, y2: centre_base.y2, y3: base.y1
	)

	Triangle.new(
		color: %w(#FFFF00 #FF00FF #FF50A6), opacity: 0.75,
		x1: (centre + @x4) / 2, x2: centre, x3: @x4,
		y1: @y2, y2: @y1, y3: @y1
	)

	Triangle.new(
		x1: centre, x2: @x3, x3: @x2,
		y1: @y3, y2: @y1, y3: @y1,
		color: '#FFFFFF', opacity: 0.5
	)

	Triangle.new(
		x1: centre, x2: @x3, x3: @x2,
		y1: @y1, y2: @y2, y3: @y3,
		color: '#FFFFFF', opacity: 0.5,
	)

	on :key_down do |k|
		if k.key == 'f11'
			@fullscreen += 1
			close if Open3.pipeline_start("ruby #{File.join(__FILE__)} #{@fullscreen}")
		elsif k.key == 'escape'
			close
		end
	end

	update do
		particles.each_with_index do |el, index|
			el.y += index / (particle / 2.0)
			el.x, el.y, el.size, el.color = rand(@width), 0, rand(1..3), "##{SecureRandom.hex(3)}" if el.y > @height + el.height
		end
	end
end

main(WIDTH, HEIGHT, FPS, SIZE, PARTICLES, FROZEN_PARTICLES, TITLE)
show
