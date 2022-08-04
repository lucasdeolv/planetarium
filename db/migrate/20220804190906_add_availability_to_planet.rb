class AddAvailabilityToPlanet < ActiveRecord::Migration[6.1]
  def change
    add_column :planets, :availability, :boolean, default: true
  end
end
