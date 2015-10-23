class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :site
      t.references :user
      t.string :title
      t.text :content
      t.integer :parent_id
      t.integer :position
      t.timestamps null: false
    end
  end
end
