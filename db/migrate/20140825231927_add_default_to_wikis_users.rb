class AddDefaultToWikisUsers < ActiveRecord::Migration
  def change
    change_column :wikis_users, :collaborators, :boolean, :default =>true
  end
end
