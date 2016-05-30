require 'active_support/core_ext/string/inflections'

class Filter
  def brew
    :cup_of_filtered_coffee
  end
end

class Espresso
  def brew
    :cup_of_espresso
  end
end

class ColdBrew
  def brew
    :cup_of_cold_brew
  end
end

class UnknownBrewError < StandardError
end

class UnknownBrew
  def brew
    raise UnknownBrewError
  end
end

class Barista
  def initialize(brewing_methods)
    @brewing_methods = brewing_methods
  end

  def make_coffee(brewing_method)
    strategy_class = brewing_method.to_s.classify.constantize
    strategy = @brewing_methods.detect { |m| m == strategy_class } || UnknownBrew
    strategy.new.brew
  end
end

alice = Barista.new([Espresso, ColdBrew])
bob = Barista.new([Espresso, Filter])

puts alice.make_coffee(:cold_brew)
puts bob.make_coffee(:espresso)
