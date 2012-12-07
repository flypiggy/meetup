class Votes < ActiveRecord::Migration
  def up
    create_table :votes do |t|
      t.integer :post_id
      t.timestamps
    end
  end

  def down
    drop_table :votes
  end
end