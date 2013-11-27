require 'yaml'

class Test2 
  @@one = 1              # class variable
  @@two = 2
  @@three = 'Something'
  @oneb                  # instance variable
  attr_accessor :oneb

  def Test2::m           # class method
    puts 'I am inside m test'
  end

  # accessor method
  def Test2::one
    @@one
  end

  def m     # instance method
    puts 'inside lower m'
  end

end

test = {one: 1, two: 2, three: 'Here it is'}   # Object of type hash     

puts Test2.one      # access class variable
puts Test2.m        # access class method m
puts Test2.to_yaml  # show whole class def
puts test[:three]   # access hash item

test3 = Test2.new   # create Test2 instance
test3.oneb = 'One'  # set instance var
puts test3.oneb     # confirm
puts test3.m        # access instance method m 


