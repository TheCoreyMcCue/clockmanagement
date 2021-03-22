class Blog < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true

  belongs_to :user
  # has_one_attached :photo
end
