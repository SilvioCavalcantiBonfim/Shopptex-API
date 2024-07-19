class Shop
  def initialize(name, color, owner, department)
    @name = name
    @color = color
    @owner = owner
    @department = department
  end

  def to_json
    { name: @name, color: @color, owner: @owner, department: @department }
  end
end
