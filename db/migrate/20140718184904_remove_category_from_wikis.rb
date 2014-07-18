class RemoveCategoryFromWikis < ActiveRecord::Migration
  def change
    remove_column :wikis, :category
  end
end
