class AddColumnNodeIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :node_id, :string
  end
end
