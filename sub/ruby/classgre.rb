#!/usr/bin/ruby



class Greeter
  def initialize(name = "World")
    @name = name
  end
  def say_hi
    puts "Hi #{@name}!"
  end
  def say_bye
    puts "Bye #{@name}, come back soon."
  end
end

g = Greeter.new("Paul")

g.say_hi

g.say_bye

g.respond_to?("name")
g.respond_to?("say_hi")
g.respond_to?("to_s")

