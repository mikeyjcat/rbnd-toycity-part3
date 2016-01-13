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

  # Returns number of transactions for a client
  def self.by_customer(customer)
    @@transactions.count { |t| t.customer == customer }
  end

  # Returns the number of an items sold, and the average price
  def self.by_product(product)
    number_sold = 0
    value_sold = 0.0
    @@transactions.select { |t| t.product == product }.each do |t|
      number_sold += t.volume
      value_sold += t.volume * t.price
    end
    { volume: number_sold, average_price: value_sold / number_sold }
  end

  private

  def add_transaction
    @@transactions << self
  end

  def decrease_stock
    @product.stock -= @volume
  end
end
