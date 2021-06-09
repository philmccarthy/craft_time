class Person
  attr_reader :name, :interests, :supplies

  def initialize(data)
    @name = data[:name]
    @interests = data[:interests]
    @supplies = Hash.new(0)
  end

  def add_supply(type, count)
    supplies.store(type, count)
  end

  def can_build?(craft)
    craft.supplies_required.all? do |type, count_required|
      supplies[type.to_s] >= count_required
    end
  end
end
