class Order < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :order_items
  has_one :payment

  # Attributes
  attribute :date, :date
  attribute :total, :decimal, default: 0.00
  
  # Validations

  validates :total, numericality: { greater_than_or_equal_to: 0 }

  # Methods

  # Callbacks
  before_save :update_total

  private 

  def update_total
    self.total = order_items.sum('quantity * price')
  end
end
