class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.text :front_content
      t.text :back_content
      t.integer :mastery
      t.integer :stack_id

      t.timestamps
    end
  end
end
