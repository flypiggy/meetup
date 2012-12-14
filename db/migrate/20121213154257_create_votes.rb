class CreateVotes < ActiveRecord::Migration
  def up
    create_table :votes do |t|
      t.string :vote_action
      t.integer :post_id
      t.timestamps
    end
  end

  def down
    drop_table :votes
  end
end
