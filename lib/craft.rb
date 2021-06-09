class Craft
  attr_reader :name, :supplies_required
  
  def initialize(name, supplies)
    @name = name
    @supplies_required = supplies
  end
end