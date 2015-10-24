class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :site
      t.references :user
      t.string :slug
      t.string :title
      t.text :content
      t.integer :parent_id, :null => true, :index => true
      t.integer :lft, :null => false, :index => true
      t.integer :rgt, :null => false, :index => true
      t.timestamps null: false
    end
  end
end
