class Barista
  def make_coffee(brewing_method)
    case brewing_method
    when :filter    then :cup_of_filtered_coffee
    when :espresso  then :cup_of_espresso
    when :cold_brew then :cup_of_cold_brew
    else raise
    end
  end
end

puts Barista.new.make_coffee(:filter)
