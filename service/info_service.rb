require './model/shop'

class InfoService
  def self.create
    shop = Shop.new('Tech Haven', '#00FF00', 'Alice Johnson', 'Electronics')
    shop.to_json
  end
end
