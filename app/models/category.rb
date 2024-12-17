class Category < ApplicationRecord
  include Ransackable
  
  has_many :products
  enum category: { fruit: 0, vegetable: 1 }

  def display_name
    category.humanize
  end
end
