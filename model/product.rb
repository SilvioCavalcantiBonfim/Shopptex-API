class Product
  def initialize(photo, name, price, is_promotion)
    @photo = photo
    @name = name
    @price = price
    @is_promotion = is_promotion
  end

  def to_json
    { photo: @photo, name: @name, price: @price, is_promotion: @is_promotion }
  end
end
