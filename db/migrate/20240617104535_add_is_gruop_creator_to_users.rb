class AddIsGruopCreatorToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_group_creator, :boolean, default: false
  end
end
