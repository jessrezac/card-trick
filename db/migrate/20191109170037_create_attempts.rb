class CreateAttempts < ActiveRecord::Migration[6.0]
  def change
    create_table :attempts do |t|
      t.boolean :success
      t.integer :card_id
      t.integer :user_id

      t.timestamps
    end
  end
end
