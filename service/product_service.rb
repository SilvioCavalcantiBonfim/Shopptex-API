require "./repository/product_repository"

class ProductService
  def self.getAll
    ProductRepository.getAll.map(&:to_json)
  end
end
