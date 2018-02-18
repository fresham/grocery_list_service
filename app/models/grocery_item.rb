class GroceryItem < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
