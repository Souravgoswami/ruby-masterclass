#!/usr/bin/ruby -w
%w(ruby2d open3 securerandom).each { |g| require(g) }

fullscreen, particles_speed, design_chooser, font_chooser, soundvar = ARGV[0].to_i, ARGV[1].to_i.next, ARGV[2].to_i, ARGV[3].to_i, ARGV[4].to_i
fonts = Dir.children(File.join(File.dirname(__FILE__), %w(Assets Fonts))).map { |f| File.join("#{File.dirname(__FILE__)}", %w(Assets Fonts), "#{f}") }
FONT = fonts[font_chooser % fonts.size]

@width, @height, @fps = 640, 480, 60
set(width: @width, height: @height, fps_cap: @fps, fullscreen: fullscreen.odd?, title: 'Colour::Clock')

bg = Rectangle.new(width: @width, height: @height, color: %w(blue red green yellow))
particles = Array.new(250) { Square.new(x: rand(@width), y: rand(@height), size: rand(1..2)) }

sound  = Music.new(File.join(File.dirname(__FILE__), %w(Assets Sounds 264498__foolboymedia__tick-tock.wav)), loop: true)
sound.play if soundvar.odd?

time = -> { "#{Time.new.strftime('%H:%M:%S')}:#{Time.new.strftime('%N')[0..1]}" }
timelabel = Text.new(time.call, font: FONT, size: 50).tap { |t| t.x, t.y = @width / 2 - t.width / 2 - 25, @height / 2 - t.height / 2}
ampm = Text.new(Time.new.strftime('%p'), font: FONT, size: 50, x: timelabel.x + timelabel.width + 15, y: timelabel.y)

design = <<~EOF.split("\n")
	p.x, p.y = p.x + Math.cos(i) * particles_speed, p.y + Math.cos(i) * particles_speed
	p.x, p.y = p.x - Math.cos(i) * particles_speed, p.y + Math.cos(i) * particles_speed
	p.x, p.y = p.x + Math.cos(i) * particles_speed, p.y + Math.sin(i) * particles_speed
	p.x = p.x + Math.cos(i) * particles_speed
	p.y = p.y + Math.cos(i) * particles_speed
	p.x, p.y = p.x + Math.sin(i) * particles_speed, p.y + Math.tan(i) * particles_speed
	p.x, p.y = p.x + Math.tan(i) * particles_speed, p.y + Math.sin(i) * particles_speed
	p.x, p.y = p.x - particles_speed, p.y - Math.sin(i)
	p.x, p.y = p.x + particles_speed, p.y + Math.sin(i)
	p.x, p.y = p.x + Math.sin(i), p.y - particles_speed
	p.x, p.y = p.x + Math.sin(i), p.y + particles_speed
EOF
design_size = design.size

update do
	particles.each_with_index do |p, i|
		Kernel.eval(design[design_chooser % design_size])
		p.x, p.y = rand(@width), rand(@height) if (p.x < -p.size || p.x > @width + p.size) || (p.y < -p.size || p.y > @height + p.size)
	end
	timelabel.text, ampm.text = time.call, Time.new.strftime('%p')
end

on :key_down do |k|
	case k.key
	when 'escape' then close
	when 'right shift', 'right ctrl' then bg.color = [rand, rand, rand, 1]
	when 'left shift', 'left ctrl' then bg.color = Array.new(4) { "##{SecureRandom.hex(3)}" }
	when 'right' then design_chooser += 1
	when 'left' then design_chooser -= 1
	when 'f1' then (soundvar += 1).odd? ? sound.play : sound.stop

	when 'f2' then
		close if Open3.pipeline_start(
			"#{File.join(RbConfig::CONFIG['bindir'], 'ruby')} '#{__FILE__}' #{[fullscreen, particles_speed, design_chooser, (font_chooser += 1), soundvar].join(' ')}"
		)

	when 'f11'
		puts (fullscreen += 1).even? ? 'Window Mode' : 'Fullscreen Mode'
		close if Open3.pipeline_start(
			"#{File.join(RbConfig::CONFIG['bindir'], 'ruby')} '#{__FILE__}' #{[fullscreen, particles_speed, design_chooser, font_chooser, soundvar].join(' ')}"
		)

	end
end

on :key_held do |k|
	particles_speed += 0.025 if k.key == 'up'
	particles_speed -= 0.025 if k.key == 'down'
end

on(:mouse_scroll) { |e| particles_speed += e.delta_y < 0 ? 0.5 : -0.5 }

show
