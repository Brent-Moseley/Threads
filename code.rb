#
# Produce data test file
#
# Useage:  ruby code.rb [en | de] [file]

command = ARGV[0]

if !["en", "de", "sh"].include? command || ARGV.length != 2
	puts "Invalid use!"
	puts "Useage:  ruby code.rb [en | de] [file]"
	exit
end

test_str = ""
open(ARGV[1]) do |f|
  data = f.read # This returns a string even if the file is empty.
  test_str << data
end

if command == "en"
	#puts ("  read file:  #{test_str}")
	temp_arr = test_str.split(' ')

	coded = ""
	temp_arr.reverse!
	temp_arr.each { |i| coded << i.reverse << '/'}
	coded.gsub!(/[eras]/, 'e' => '^', 'r' => '@', 'a' => '~', 's' => '#')
	#coded.gsub!(/e/, '^')
	#coded.gsub!(/r/, '@')
	#coded.gsub!(/a/, '~')
	#coded.gsub!(/s/, '#')

	puts "\n  => #{coded}"
	writeout = coded
end

if command == "de"
	restore = ""
	test_str.split('/').reverse!.each { |i| restore << i.reverse << ' '}
	restore.gsub!(/[\^@~#]/, '^' => 'e', '@' => 'r', '~' => 'a', '#' => 's')

	# restore.gsub!(/\^/, 'e')
	# restore.gsub!(/@/, 'r')
	# restore.gsub!(/~/, 'a')
	# restore.gsub!(/#/, 's')

	puts "\n  => #{restore}"
	writeout = restore
end

if command == "sh"
	restore = ""
	test_str.split('/').reverse!.each { |i| restore << i.reverse << ' '}
	restore.gsub!(/\^/, 'e')
	restore.gsub!(/@/, 'r')
	restore.gsub!(/~/, 'a')
	restore.gsub!(/#/, 's')

	puts "\n  => #{restore}"
	exit
end

f = File.new(ARGV[1], 'w')
f.write (writeout)
f.close	
