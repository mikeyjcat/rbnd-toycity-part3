# Maintains the list of transactions, and transaction behavior
class Transaction
  attr_reader :id, :customer, :product, :volume, :price
  @@transactions = []
  @@id = 1

  def initialize(customer, product, volume, price)
    @id = @@id
    @@id += 1
    @customer = customer
    @product = product
    @volume = volume
    @price = price
    add_transaction
    decrease_stock
  end

  def self.all
    @@transactions
  end

  def self.find(id)
    @@transactions.find { |t| t.id == id }
  end

  def self.by_customer(customer)
    @@transactions.select { |t| t.customer == customer }
  end

  def self.by_product(product)
    @@transactions.select { |t| t.product == product }
  end

  private

  def add_transaction
    @@transactions << self
  end

  def decrease_stock
    @product.stock -= @volume
  end
end
