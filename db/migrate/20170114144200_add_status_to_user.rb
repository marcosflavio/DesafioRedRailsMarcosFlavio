class AddStatusToUser < ActiveRecord::Migration
  def change
    add_column :users, :status, :string 
    add_index :users,:status  
  end
end
