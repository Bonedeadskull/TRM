class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :injury, index: true, foreign_key: true
      t.references :treatment, index: true, foreign_key: true
      t.string :location

      t.timestamps null: false
    end
  end
end
