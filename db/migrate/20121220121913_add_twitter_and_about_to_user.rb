class AddTwitterAndAboutToUser < ActiveRecord::Migration
  def change
    add_column :users, :twitter, :string
    add_column :users, :about, :text
  end
end
