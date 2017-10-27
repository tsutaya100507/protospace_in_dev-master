class AddLikeCountToCapturedImages < ActiveRecord::Migration
  def change
    add_column :captured_images, :likes_count, :integer
  end
end
