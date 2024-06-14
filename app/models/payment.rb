class Payment < ApplicationRecord
  
  # Associations 

  belongs_to :order

  # Attributes

  attribute :paymentmethod, :string, :default => 'cash'
  attribute :amount, :decimal

  # Validations

  validates :paymentmethod, presence: true

  # Methods
  

  # Callback

  ## Sets the default to Order total
  def set_amount
    self.amount = order.total
  end

  before_save :set_amount
  
end
