class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.integer :state
      t.string :owner_email
      t.timestamps
    end
  end
end
