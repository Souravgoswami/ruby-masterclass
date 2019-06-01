#!/usr/bin/ruby -w
%w(ruby2d open3 securerandom).each { |g| require(g) }

PATH = File.dirname(__FILE__)
fullscreen, particles_speed, design_chooser, font_chooser, soundvar = ARGV[0].to_i, ARGV[1].to_i.next, ARGV[2].to_i, ARGV[3].to_i, ARGV[4].to_i
fonts = Dir.children(File.join(PATH, %w(Assets Fonts))).map { |f| File.join("#{PATH}", %w(Assets Fonts), "#{f}") }
FONT = fonts[font_chooser % fonts.size]

config_file = IO.readlines(File.join(PATH, 'config.conf')).map { |o| o.strip.downcase }
read_config = ->(option) { config_file.select { |o| o.start_with?(option.downcase) }[-1].to_s.split('=')[-1].to_s.strip }

%w(width height fps particles fontsize).zip(%w(640 480 60 300 50)).each do |v|
	begin
		Kernel.eval(read_config.(v[0]).scan(/[0-9+\-\/*%.]/).join).to_i.tap { |o| binding.eval("@#{v[0]} = o == 0 ? #{v[1]} : o") }
	rescue Exception => e
		binding.eval("@#{v[0]} = #{v[1]}")
		Kernel.warn("!!! #{e.to_s.capitalize}\nError Parsing the Configuration. Error:\n\t#{v[0].capitalize} = #{read_config.(v[0])}.\n\tFell back to #{v[1]}")
	end
end

set(width: @width, height: @height, fps_cap: @fps, fullscreen: fullscreen.odd?, title: 'Colour::Clock', resizable: true)

bg = Rectangle.new(width: @width, height: @height, color: %w(blue red green yellow))
particles = Array.new(@particles) { Square.new(x: rand(@width), y: rand(@height), size: rand(1..2)) }

sound  = Music.new(File.join(PATH, %w(Assets Sounds 264498__foolboymedia__tick-tock.wav)), loop: true)
sound.play if soundvar.odd?

time = -> { "#{Time.new.strftime('%H:%M:%S')}:#{Time.new.strftime('%N')[0..1]}" }
timelabel = Text.new("00:00:00:00", font: FONT, size: @fontsize).tap { |t| t.x, t.y = @width / 2 - t.width / 2 - 25, @height / 2 - t.height / 2}
ampm = Text.new(Time.new.strftime('%p'), font: FONT, size: @fontsize, x: timelabel.x + timelabel.width + 15, y: timelabel.y)

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
	when 'i'
		bg.color = 4.times.each_with_object([]) { |i, a|
			bg.color[i].tap { |c| a << '#' + [c.b, c.g, c.r].map { |x| (x * 255).ceil.to_s(16) }.map { |x| x.length == 1 ? '0' + x : x }.join }
		} if Ruby2D::Color::Set === bg.color

	when 'r'
		bg.color = 4.times.each_with_object([]) { |i, a|
			bg.color[i].tap { |c| a << '#' + [c.r, c.g, c.b].map { |x| (x * 255).ceil.to_s(16) }.map { |x| x.length == 1 ? '0' + x : x }.join }
		}.rotate(-1) if Ruby2D::Color::Set === bg.color

	when 'f2'
		close if Open3.pipeline_start(
			"#{File.join(RbConfig::CONFIG['bindir'], 'ruby')} '#{__FILE__}' #{[fullscreen, particles_speed, design_chooser, (font_chooser += 1), soundvar].join(' ')}"
		)

	when 'f3'
		puts "Trying to spawn a new #{File.basename(__FILE__)} window!"
		Open3.pipeline_start("#{File.join(RbConfig::CONFIG['bindir'], 'ruby')} '#{__FILE__}' #{[fullscreen, particles_speed, design_chooser, font_chooser, soundvar].join(' ')}")

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
