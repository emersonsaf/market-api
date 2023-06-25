class Purchase < ApplicationRecord
    belongs_to :client
    has_many :purchase_items
    has_many :products, through: :purchase_items
  
    accepts_nested_attributes_for :purchase_items
end