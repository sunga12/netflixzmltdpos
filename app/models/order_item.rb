class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  # Attributes

  attribute :quantity, :integer
  attribute :price, :decimal


  # Validations 

  validates :quantity, presence: true

  # Methods

  #Set the default to the product price


  # Callbacks
  
  


end
