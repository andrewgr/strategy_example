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
    case brewing_method
    when :filter    then Filter.new.brew
    when :espresso  then Espresso.new.brew
    when :cold_brew then ColdBrew.new.brew
    else raise
    end
  end
end

puts Barista.new.make_coffee(:cold_brew)
