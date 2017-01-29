class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.references :athlete, index: true, foreign_key: true
      t.references :trainer, index: true, foreign_key: true
      t.string :treatment_location
      t.references :action, index: true, foreign_key: true
      t.text :comment
      t.date :date
      t.string :time
    end
  end
end
