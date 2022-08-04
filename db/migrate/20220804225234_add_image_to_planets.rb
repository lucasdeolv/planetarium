class AddImageToPlanets < ActiveRecord::Migration[6.1]
  def change
    add_column :planets, :image, :string
  end
end
