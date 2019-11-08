class AddFileIdToStacks < ActiveRecord::Migration[6.0]
  def change
    add_column :stacks, :file_id, :integer
  end
end
