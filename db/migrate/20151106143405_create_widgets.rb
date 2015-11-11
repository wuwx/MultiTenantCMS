class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :name
      t.string :title
      t.string :description
      t.references :site
      t.timestamps null: false
    end
  end
end
