class StockItem < ApplicationRecord
  belongs_to :product


# Attributes
  attribute :changetype, :string
  attribute :quantitychange, :integer
  attribute :newstocklevel, :integer

  # Validations 
  validates :changetype, presence: true
  validates :quantitychange, presence: true
  validates :newstocklevel, presence: true

end
