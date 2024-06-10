class Product < ApplicationRecord

  
    # Associations
    has_many :order_items
    has_many :stock_items
  
    # Attributes
    attribute :name, :string
    attribute :description, :string
    attribute :category, :string
    attribute :price, :decimal
    attribute :sku, :string
    attribute :stocklevel, :integer
    attribute :reorderlevel, :integer
  
    # Validations
    validates :name, presence: true
    validates :description, presence: true, length: { maximum: 150 }
    validates :category, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :stocklevel, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :reorderlevel, presence: true, numericality: { greater_than_or_equal_to: 0 }
  
    # Methods
  
    # Callbacks

end
