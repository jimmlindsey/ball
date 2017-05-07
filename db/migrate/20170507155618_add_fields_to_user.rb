class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :fullname, :string
    add_column :users, :username, :string
    add_index :users, :username, unique: true
    add_column :users, :instagram, :string
    add_column :users, :player, :string
    add_column :users, :location, :string
    add_column :users, :description, :text
    add_column :users, :position, :string
  end
end
