class Post < ApplicationRecord
  has_many :replies
  validates :title, presence: { message: "제목을 입력해 주세요." }
end
