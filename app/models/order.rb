class Order < ApplicationRecord
  
  
  # Associations
  belongs_to :user
  has_many :order_items
  has_one :payment

  # Attributes
  attribute :date, :date
  attribute :total, :decimal

  # Validations

  validates :total, numericality: { greater_than_or_equal_to: 0 }

  # Methods

  # Callbacks

end
