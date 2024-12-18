class Blog < ApplicationRecord
  include Ransackable

  has_one_attached :image
  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 500 }
end
