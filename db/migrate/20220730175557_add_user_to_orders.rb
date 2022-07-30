class AddUserToOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :user, null: false, foreign_key: true
    add_reference :orders, :planet, null: false, foreign_key: true
  end
end
