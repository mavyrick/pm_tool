class ChangeColumnFromPostToProject < ActiveRecord::Migration[5.0]
  def change
    remove_column :favourites, :post_id
    add_column :favourites, :project_id, :integer, index: true
  end
end
