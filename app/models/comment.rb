class Comment < ApplicationRecord
  belongs_to :post

  def self.recent
    order(updated_at: :desc).limit(3)
  end
end
