class Planet < ApplicationRecord
  belongs_to :user

  validates :name, :galaxy, :price, :size, :temperature, :pressure, presence: true
end
