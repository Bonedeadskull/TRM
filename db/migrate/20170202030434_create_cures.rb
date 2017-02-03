class CreateCures < ActiveRecord::Migration
  def change
    create_table :cures do |t|
      t.references :treatment, index: true
      t.references :taction, index: true
      t.timestamps null: false
    end
  end
end
