class CreateResponders < ActiveRecord::Migration
  def change
    create_table :responders do |t|
      t.string :type
      t.integer :capacity
      t.boolean :on_duty, default: false
      t.string :name
      t.string :emergency_code

      t.timestamps null: false
    end
  end
end
