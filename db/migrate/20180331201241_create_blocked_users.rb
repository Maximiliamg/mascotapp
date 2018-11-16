class CreateBlockedUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :blocked_users do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
