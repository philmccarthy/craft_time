class Event
  attr_reader :name, :people, :crafts
  
  def initialize(name, crafts, people)
    @name = name
    @people = people
    @crafts = crafts
  end

  def attendee_names
    people.map { |person| person.name }
  end

  def craft_with_most_supplies
    crafts.max_by { |craft| craft.supplies_required.size}.name
  end

  def supply_list
    crafts.flat_map do |craft|
      craft.supplies_required.keys.map { |craft_type| craft_type.name }
    end.uniq
  end

  def attendees_by_craft_interest
    crafts.each_with_object(Hash.new([])) do |craft, breakdown|
      breakdown[craft.name] = people.select { |person| person.interests.include?(craft.name) }
    end
  end

  def crafts_that_use(supply_type)
    crafts.select do |craft|
      craft.supplies_required.keys.map(&:to_s).include? supply_type
    end
  end
end
