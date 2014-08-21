class AddTypeToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :type, :string
  end
end
