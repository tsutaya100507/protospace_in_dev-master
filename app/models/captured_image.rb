class CapturedImage < ActiveRecord::Base
  belongs_to :Prototype
  has_many :likes, dependent: :destroy

  mount_uploader :content, PrototypeImageUploader

  enum status: %i(main sub)

  validates :content,
            :status,
            presence: true
end
