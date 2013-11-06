
#
# Produce data test file
#
# Useage:  ruby code.rb [en | de] [file]

command = ARGV[0]

if (command != "en" and command != "de") or ARGV.length != 2
	puts "Invalid use!"
	puts "Useage:  ruby code.rb [en | de] [file]"
	exit
end

test_str = ""
open(ARGV[1]) {|f|
  data = f.read # This returns a string even if the file is empty.
  test_str << data
}

if command == "en"
	#puts ("  read file:  #{test_str}")
	temp_arr = test_str.split(' ')

	coded = ""
	temp_arr.reverse!
	temp_arr.each { |i| coded << i.reverse << '/'}
	coded.gsub!(/e/, '^')
	coded.gsub!(/r/, '@')
	coded.gsub!(/a/, '~')
	coded.gsub!(/s/, '#')

	puts "\n  => #{coded}"
	writeout = coded
end

if command == "de"
	restore = ""
	test_str.split('/').reverse!.each { |i| restore << i.reverse << ' '}
	restore.gsub!(/\^/, 'e')
	restore.gsub!(/@/, 'r')
	restore.gsub!(/~/, 'a')
	restore.gsub!(/#/, 's')

	puts "\n  => #{restore}"
	writeout = restore
end

f = File.new(ARGV[1], 'w')
f.write (writeout)
f.close	


# Waitress at Ra with the perfect attitude: Courtney. Strong and confident, yet balanced. Positive, forward looking and with a plan, and also realistic about things. Not afraid to be herself. 'This Ra job is not the greatest, since I am getting bored, but I will be traveling soon anyway, while I am still in my 20's. I have a plan B. I am not sure if I will stay here in AZ, I have been in CA the last 8 months.' Tact (soft look), presentation, image, work ethic, very sharp, relax about things! sharp, quick, intelligent, astute, clever, quick-witted. Unapologetic confidence, unwavering positive expectation, hard work is always worth it, unwavering belief in that and in progress and potential. Examples of great attitudes: Bruce, Micheal, Rick 
