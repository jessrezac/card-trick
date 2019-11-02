class ChangeImage < ActiveRecord::Migration[6.0]
  def change
    rename_column :stacks, :image, :thumbnail
  end
end