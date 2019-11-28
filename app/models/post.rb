class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_rich_text :body
end
