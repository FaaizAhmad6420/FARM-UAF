class Order < ApplicationRecord
  include Ransackable
  
  belongs_to :user
  has_one :payment
  has_many :carts
  has_many :products, through: :carts

  enum status: { cart: 'cart', completed: 'completed' }
end
