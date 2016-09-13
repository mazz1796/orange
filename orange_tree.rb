# This is how you define your own custom exception classes
class NoOrangesError < StandardError
end

class OrangeTree
  # Ages the tree one year
  attr_reader :age,:height,
  Max_age = 13
  Fruit_bearing_age = 4

  def initialize
    @age = 0
    @height = 0
    @num_orange = []
    
  end

  def age!
    unless @age == @dead
      @age += 1   #age by 1 if only the tree is not dead
      
      @height += rand(3) +50
      rand(100..300).times {@num_orange << Orange.new(rand(0.1..03))} if @age > Fruit_bearing_age
    end
  end
  def dead?
    @age >= Max_age
  end

  # Returns +true+ if there are any oranges on the tree, +false+ otherwise
  def any_oranges?
    @num_orange.length > 0
  end

  # Returns an Orange if there are any
  # Raises a NoOrangesError otherwise
  def pick_an_orange!
    raise NoOrangesError, "This tree has no oranges" unless self.any_oranges?

    # orange-picking logic goes here
    
    @num_orange.pop
    
  end
end

class Orange
  attr_reader:diameter
  # Initializes a new Orange with diameter +diameter+
  def initialize(diameter)
    @diameter = diameter
  end
end


tree = OrangeTree.new

tree.age! until tree.any_oranges?

puts "Tree is #{tree.age} years old and #{tree.height} feet tall"

until tree.dead?
  basket = []

  #It places the oranges in the basket

  while tree.any_oranges?
    basket << tree.pick_an_orange!
  end

  

  # It's up to you to calculate the average diameter for this harvest.
  
  sum = 0
  basket.each {|orange| sum += orange.diameter}
    avg_diameter = sum/basket.length
  

  puts "Year #{tree.age} Report" 
  puts "Tree height: #{tree.height} feet"
  puts "Harvest: #{basket.size} oranges with an average diameter of #{avg_diameter} inches"
  puts ""

   #Age the tree another year
   tree.age!
 end

 puts "Alas, the tree, she is dead!"