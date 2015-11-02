class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.references :user
      t.string :slug
      t.string :title
      t.string :theme
      t.timestamps null: false
    end
  end
end
