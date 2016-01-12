# Maintains the list of transactions, and transaction behavior
class Transaction
  attr_reader :id, :customer, :product
  @@transactions = []
  @@id = 1

  def initialize(customer, product)
    @id = @@id
    @@id += 1
    @customer = customer
    @product = product
    add_transaction
    decrease_stock
  end

  def self.all
    @@transactions
  end

  def self.find(id)
    @@transactions.find { |t| t.id == id }
  end

  private

  def add_transaction
    @@transactions << self
  end

  def decrease_stock
    @product.stock -= 1
  end
end
