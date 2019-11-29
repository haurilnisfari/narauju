class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_rich_text :body

  def self.published
    where(state: "publish")
  end

  def self.popular
    order(view_count: :desc).limit(3)
  end

  def publish?
    self.state == "publish"
  end

  def draft?
    self.state == "draft"
  end

end
