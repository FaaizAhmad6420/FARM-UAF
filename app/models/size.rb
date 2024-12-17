class Size < ApplicationRecord
  include Ransackable

  has_many :product_sizes
  has_many :products, through: :product_sizes
  has_many :carts
  
  enum size: { "1kg": 0, "3kg": 1, "5kg": 5 }

  def display_name
    size.humanize
  end
end
