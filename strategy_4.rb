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

class Barista
  def make_coffee(brewing_method)
    strategy = {
      filter: Filter,
      espresso: Espresso,
      cold_brew: ColdBrew
    }[brewing_method] || raise
    strategy.new.brew
  end
end

puts Barista.new.make_coffee(:cold_brew)
