class Payment < ApplicationRecord
  
  # Associations 

  belongs_to :order

  # Attributes

  attribute :paymentmethod, :string
  attribute :amount, :decimal

  # Validations

  validates :paymentmethod, presence: true
  validates :amount, presence: true


  # Methods

  ## Sets the default to Order total

  #
end
