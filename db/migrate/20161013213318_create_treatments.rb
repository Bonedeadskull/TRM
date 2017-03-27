class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.references :athlete, index: true
      t.references :trainer, index: true
      t.string :treatment_location
      t.references :taction, index: true
      t.text :comment
      t.date :date
      t.string :time
      t.timestamps
    end
  end
end
