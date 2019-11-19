class Category < ApplicationRecord
  has_many :postcategories
  has_many :posts through: :postcategories
end
