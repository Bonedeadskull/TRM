class CreateTreatmentActions < ActiveRecord::Migration
  def change
    create_table :treatment_actions do |t|
      t.references :treatment, index: true, foreign_key: true
      t.references :action, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
