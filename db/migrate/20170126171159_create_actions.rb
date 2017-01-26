class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.references :treatment, index: true, foreign_key: true
      t.string :action

      t.timestamps null: false
    end
  end
end
