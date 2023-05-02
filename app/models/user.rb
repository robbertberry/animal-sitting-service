class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum user_type: { customer: 0, admin: 1 }

  has_many :bookings, dependent: :destroy
end
