class User < ApplicationRecord
  include Ransackable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  has_many :orders, foreign_key: 'user_id'

  def current_order
    orders.find_or_create_by(status: 'cart')
  end
end
