class Customer
  attr_reader :name
  @@customers = []

  def initialize(options = {})
    @name = options[:name]
    add_customer
  end

  def purchase(product)
    unless product.in_stock?
      fail OutOfStockError, "'" + product.title + "' is out of stock"
    end
    Transaction.new(self, product)
  end

  def self.all
    @@customers
  end

  def self.find_by_name(name)
    @@customers.find { |customer| customer.name == name }
  end

  private

  def add_customer
    if Customer.find_by_name(@name)
      fail DuplicateCustomerError, "'" + @name + "' already exists"
    end
    @@customers << self
  end
end
