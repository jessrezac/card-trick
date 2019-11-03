class RemoveFrontImageFromCards < ActiveRecord::Migration[6.0]
  def change
    remove_column :stacks, :thumbnail
    remove_column :cards, :front_image
    remove_column :cards, :back_image
  end
end
