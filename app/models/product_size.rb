class ProductSize < ApplicationRecord
  include Ransackable

  belongs_to :product
  belongs_to :size
end
