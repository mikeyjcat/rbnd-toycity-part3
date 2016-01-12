# Maintains list of products, thier stock and behavior
class Product
  attr_reader :title, :price
  attr_accessor :stock
  @@products = []

  def initialize(options = {})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_product
  end

  def self.all
    @@products
  end

  def self.find_by_title(title)
    @@products.find { |p| p.title == title }
  end

  def in_stock?
    @stock > 0 ? true : false
  end

  def self.in_stock
    @@products.select(&:in_stock?)
  end

  private

  def add_product
    if Product.find_by_title(@title)
      fail DuplicateProductError, "'" + @title + "' already exists"
    end
    @@products << self
  end
end
