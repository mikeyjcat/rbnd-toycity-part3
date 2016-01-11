class Product
  attr_reader :title, :price, :stock
  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_products
  end

  def self.all
    @@products
  end

  def self.find_by_title(title)
    @@products.find { |product| product.title == title } 
  end

  def in_stock?
    @stock > 0 ? true : false
  end

  def self.in_stock
    @@products.select { |product| product.stock > 0 }
  end

  private

  def add_products
    if Product.find_by_title(@title)
      raise DuplicateProductError, "'" + @title + "' already exists"
    end 
    @@products << self
  end

end  
