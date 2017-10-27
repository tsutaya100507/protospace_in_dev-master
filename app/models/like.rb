class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :captured_image, counter_cache: :likes_count
end
