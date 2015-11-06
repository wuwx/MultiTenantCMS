class CreateCustomFields < ActiveRecord::Migration
  def change
    create_table :custom_fields do |t|
      t.string :name
      t.string :field_format
      t.references :site
      t.timestamps null: false
    end
  end
end
