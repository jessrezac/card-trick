class CreateStacks < ActiveRecord::Migration[6.0]
  def change
    create_table :stacks do |t|
      t.string :title
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
