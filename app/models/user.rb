class User < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable, :trackable

  validates :full_name, presence: true
  validates :phone, presence: true, numericality: true, length: { minimum: 10, maximum: 11 }
  validates :address, presence: true

  enum role: { general: 0, admin: 1 }
end
