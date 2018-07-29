
class ReviewUser
  include ActiveModel::Model

  attr_accessor :review_id, :user_name, :content, :updated_at
end