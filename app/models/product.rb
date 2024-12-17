class Product < ApplicationRecord
  include Ransackable

  belongs_to :category
  has_many :carts
  has_many :product_sizes, dependent: :destroy
  has_many :orders, through: :carts
  has_many :sizes, through: :product_sizes
  accepts_nested_attributes_for :product_sizes, allow_destroy: true
  has_one_attached :image
end
