require 'active_support/core_ext/string/inflections'

module Filter
  def brew
    :cup_of_filtered_coffee
  end
end

module Espresso
  def brew
    :cup_of_espresso
  end
end

module ColdBrew
  def brew
    :cup_of_cold_brew
  end
end

class UnknownBrewError < StandardError
end

module UnknownBrew
  def brew
    raise UnknownBrewError
  end
end

class BrewingStrategyFactory
  def initialize(brewing_method)
    strategy = {
      filter: Filter,
      espresso: Espresso,
      cold_brew: ColdBrew
    }.fetch(brewing_method, UnknownBrew)

    self.extend(strategy)
  end
end

class Barista
  def make_coffee(brewing_method)
    strategy = BrewingStrategyFactory.new(brewing_method)
    strategy.brew
  end
end

puts Barista.new.make_coffee(:cold_brew)
