class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments, :foreign_key => "post_id"
  has_rich_text :body
  extend FriendlyId
  friendly_id :title, use: :slugged

  # def sum(num, other_num)
  #   num + other_num
  # end

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

  def related
    category_ids = self.category_ids
    post_category_ids = PostCategory.where(category_id: category_ids).pluck(:post_id)
    Post.where(id: post_category_ids).where(state: 'publish').limit(3)
  end

  def previous
    Post.where(state: 'publish').where('id < ?', self.id).last
  end

  def next
    Post.where(state: 'publish').where('created_at > ?', self.created_at).first
  end


end
