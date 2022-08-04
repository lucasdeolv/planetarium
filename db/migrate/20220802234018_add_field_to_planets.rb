class AddFieldToPlanets < ActiveRecord::Migration[6.1]
  def change
    add_column :planets, :bought, :boolean, default: false
  end
end
