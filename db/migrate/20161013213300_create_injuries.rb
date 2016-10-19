class CreateInjuries < ActiveRecord::Migration
  def change
    create_table :injuries do |t|
      t.references :athlete, index: true, foreign_key: true
      t.string :status
      t.boolean :active
      t.string :injury_location
      t.string :status
      t.text :comment
      t.date :date
    end
  end
end
