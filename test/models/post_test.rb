require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # test "#sum" do
  #   post = Post.new
  #   result = post.sum(5, 2)
  #
  #   assert_equal 7, result
  # end

  test ".published" do
    post_one = Post.create(title: "post one", state: "draft")
    post_two = Post.create(title: "post two", state: "publish")
    post_three = Post.create(title: "post three", state: "draft")

    result = Post.published

    assert_equal 1, result.count
    assert_includes result, post_two
  end
end
