require './service/product_service'
require './service/info_service'

class Controller
  def self.getInfo
    InfoService.create
  end

  def self.getAllProducts
    ProductService.getAll
  end
end
