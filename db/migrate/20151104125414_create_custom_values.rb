class CreateCustomValues < ActiveRecord::Migration
  def change
    create_table :custom_values do |t|
      t.text :value
      t.references :custom_field
      t.references :post
      t.timestamps null: false
    end
  end
end
