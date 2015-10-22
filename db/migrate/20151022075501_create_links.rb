class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|

      t.timestamps null: false
    end
  end
end
