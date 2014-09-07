class CreateWikisUsers < ActiveRecord::Migration
  def change
    create_table :wikis_users do |t|
      t.belongs_to :users
      t.belongs_to :wikis
      t.integer :collaborator
    end
  end
end
