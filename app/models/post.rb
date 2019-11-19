class Post < ApplicationRecord
  belongs_to :user
  has_many :postcategories
  has_many :categories through: :postcategories
end
