class AddCollaboratorsToWikisUsers < ActiveRecord::Migration
  def change
    add_column :wikis_users, :collaborators, :boolean, default: true
  end
end
