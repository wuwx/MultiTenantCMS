class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.string :name
      t.string :image
      t.timestamps null: false
    end
  end
end
