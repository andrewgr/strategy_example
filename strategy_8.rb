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

class ExpertBrewingStrategyFactory
  def initialize(brewing_method)
    strategy = {
      filter: Filter,
      espresso: Espresso,
      cold_brew: ColdBrew
    }.fetch(brewing_method, UnknownBrew)

    self.extend(strategy)
  end
end

class JuniorBrewingStrategyFactory
  def initialize(brewing_method)
    strategy = {
      espresso: Espresso
    }.fetch(brewing_method, UnknownBrew)

    self.extend(strategy)
  end
end

class Barista
  def initialize(brewing_strategy_factory)
    @brewing_strategy_factory = brewing_strategy_factory
  end

  def make_coffee(brewing_method)
    strategy = @brewing_strategy_factory.new(brewing_method)
    strategy.brew
  end
end

alice = Barista.new(ExpertBrewingStrategyFactory)
bob = Barista.new(JuniorBrewingStrategyFactory)
puts alice.make_coffee(:cold_brew)
puts alice.make_coffee(:espresso)
