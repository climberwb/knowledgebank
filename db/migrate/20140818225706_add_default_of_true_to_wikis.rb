class AddDefaultOfTrueToWikis < ActiveRecord::Migration
  def change
    change_column :wikis, :public, :boolean, :default => true
  end
end
