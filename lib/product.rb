class Product
  attr_reader :title
  @@products = []

  def initialize(options={})
    @title = options[:title]
    add_products
  end

  def self.all
    @@products
  end

  private

  def add_products
    @@products.each do |product|
      if @title == product.title
        raise DuplicateProductError, "'" + product.title + "' already exists"
      end
    end 
    @@products << self
  end

end  
