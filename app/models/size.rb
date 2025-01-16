class Size < ApplicationRecord
  include Ransackable

  has_many :product_sizes
  has_many :products, through: :product_sizes
  has_many :carts
  
  enum size: { "1kg": 0, "3kg": 1, "5kg": 5 }

  def multiplier
    case size
    when "1kg"
      1.0
    when "3kg"
      3.0
    when "5kg"
      5.0
    else
      1.0 # Default multiplier
    end
  end

  def display_name
    size.humanize
  end
end
