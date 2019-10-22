class AddPseudoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pseudo, :string
    add_index :users, :pseudo, unique: true
  end
end
