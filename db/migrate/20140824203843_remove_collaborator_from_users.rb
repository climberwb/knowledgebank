class RemoveCollaboratorFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :collaborator, :boolean
  end
end
