class StockItem < ApplicationRecord
  belongs_to :product

# Attributes
  attribute :changetype, :string
  attribute :quantitychange, :integer
  attribute :newstocklevel, :integer, :default => 0

  #Ex:- :default =>''

  # Validations 
  validates :changetype, presence: true, inclusion: { in: %w[up down] }
  validates :quantitychange, presence: true, numericality: { only_integer: true}
  validates :newstocklevel, numericality: { greater_than_or_equal_to: 0}

  
  # Callbacks

  def update_product_stocklevel

    case changetype
    when 'up'
      self.newstocklevel = product.stocklevel + quantitychange
      product.stocklevel += self.quantitychange
    when 'down'
      self.newstocklevel = product.stocklevel + quantitychange
      product.stocklevel -= self.quantitychange
    else
      raise 'Invalid changetype'
    end
    product.save!

  end

  # Methods

  # def set_stocklevel
  #   self.newstocklevel += quantitychange
    
  # end

  before_save :update_product_stocklevel

end
