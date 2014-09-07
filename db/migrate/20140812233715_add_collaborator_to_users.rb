class AddCollaboratorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :collaborator, :boolean
  end
end
