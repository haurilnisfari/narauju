class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments, :foreign_key => "post_id"
  has_rich_text :body
  extend FriendlyId
  friendly_id :title, use: :slugged

  def self.published
    where(state: "publish")
  end

  def self.popular
    order(view_count: :desc).limit(3)
  end

  def self.recent
    order(updated_at: :desc).limit(3)
  end

  def publish?
    self.state == "publish"
  end

  def draft?
    self.state == "draft"
  end

  def self.search(search)
    if search
      Post.published.where("title LIKE ?", "%#{search}%")
    else
      Post.published
    end
  end

end
