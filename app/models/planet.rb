class Planet < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  validates :name, :galaxy, :price, :size, :temperature, :pressure, presence: true

  def bought!
    self.update_attribute :bought, true
  end
end
