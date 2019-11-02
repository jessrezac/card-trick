class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.text :front_content
      t.string :front_image
      t.text :back_content
      t.string :back_image
      t.integer :mastery
      t.integer :stack_id

      t.timestamps
    end
  end
end
