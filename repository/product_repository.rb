require 'csv'
require './model/product'

class ProductRepository
  def self.getAll
    products = []
    CSV.foreach('database.csv', headers: true) do |row|
      products << Product.new(row[0], row[1], row[2].to_f, row[3].downcase == 'true')
    end
    products
  end
end
