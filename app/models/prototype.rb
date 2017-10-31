class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :captured_images, dependent: :destroy
  has_many :tags, through: :prototype_tags
  has_many :prototype_tags

  accepts_nested_attributes_for :captured_images, reject_if: :reject_sub_images

  accepts_nested_attributes_for :tags, allow_destroy: true, reject_if: :reject_empty_tag


  validates :title,
            :catch_copy,
            :concept,
            presence: true

  def save_tags(tags)
    current_tags = self.tags.pluck(:title) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    old_tags.each do |old_title|
      self.tags.delete Tag.find_by(title: old_title)
    end

    new_tags.each do |new_title|
      prototype_tag = Tag.find_or_create_by(title: new_title)
      self.tags << prototype_tag if prototype_tag[:title].present?
    end
  end

  def reject_sub_images(attributed)
    attributed['content'].blank?
  end

   def reject_empty_tag(attributed)
    attributed['title'].blank?
  end

  def set_main_thumbnail
    captured_images.main.first.content
  end

  def posted_date
    created_at.strftime('%b %d %a')
  end
end
