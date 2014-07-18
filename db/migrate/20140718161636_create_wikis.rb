class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :category
      t.string :title
      t.text :body
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
