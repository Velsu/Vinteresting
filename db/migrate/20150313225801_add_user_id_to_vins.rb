class AddUserIdToVins < ActiveRecord::Migration
  def change
    add_column :vins, :user_id, :integer
    add_index :vins, :user_id
  end
end
