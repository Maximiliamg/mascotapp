class CreateBlockedProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :blocked_products do |t|
    	t.integer :product_id
    	t.integer :blocked_quantity, default: 0

      t.timestamps
    end
  end
end
