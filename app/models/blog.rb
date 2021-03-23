class Blog < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true
  validates :photo, presence: true

  has_one_attached :photo
end
