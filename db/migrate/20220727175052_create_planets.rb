class CreatePlanets < ActiveRecord::Migration[6.1]
  def change
    create_table :planets do |t|
      t.string :name
      t.string :galaxy
      t.integer :price
      t.integer :size
      t.integer :temperature
      t.integer :pressure
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
