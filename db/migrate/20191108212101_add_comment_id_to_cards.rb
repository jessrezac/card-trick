class AddCommentIdToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :comment_id, :integer
  end
end
