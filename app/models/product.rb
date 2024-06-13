class Product < ApplicationRecord
  
    # Associations
    has_many :order_items
    has_many :stock_items
  
    # Attributes
    attribute :name, :string
    attribute :description, :string, :default => "No description avaliable"
    attribute :category, :string, :default => "Uncategorized"
    attribute :price, :decimal, :default => 0.00
    attribute :sku, :string
    attribute :stocklevel, :integer, :default => 0.00
    attribute :reorderlevel, :integer, :default => 0.00
  
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
