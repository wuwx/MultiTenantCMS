class CreateCustomFields < ActiveRecord::Migration
  def change
    create_table :custom_fields do |t|
      t.string :name
      t.references :site
      t.timestamps null: false
    end
  end
end
