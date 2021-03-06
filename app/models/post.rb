class Post < ApplicationRecord
  resourcify
  has_many :replies, dependent: :destroy
  validates :title, presence: { message: "제목을 입력해 주세요." }
  mount_uploader :image, S3Uploader
end