class Planet < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  validates :name, :galaxy, :price, :size, :temperature, :pressure, presence: true
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :galaxy, :price, :size, :temperature, :pressure ],
    associated_against: {
      user: [ :first_name, :last_name ]
    },
    using: {
      tsearch: { prefix: true }
    }
  def bought!
    self.update_attribute(:bought, true)
  end
end
