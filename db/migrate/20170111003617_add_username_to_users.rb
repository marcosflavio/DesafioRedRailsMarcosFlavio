class AddUsernameToUsers < ActiveRecord::Migration
  def change
    
    add_column :users, :username, :string #adiciona uma nova coluna a tabela users, do tipo string
    add_index :users,:username, unique: true #estou falando que o nickname é unico para cada usuario 
  end
end
