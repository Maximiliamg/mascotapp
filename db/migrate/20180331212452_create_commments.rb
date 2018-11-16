class CreateCommments < ActiveRecord::Migration[5.1]
  def change
    create_table :commments do |t|
      t.integer :product_id
      t.integer :user_id
      t.string :commment

      t.timestamps
    end
  end
end
