class CreateInjuries < ActiveRecord::Migration
  def change
    create_table :injuries do |t|
      t.references :athlete, index: true, foreign_key: true
      t.string :status
      t.boolean :active
      t.string :injury_location
      t.text :tcomment
      t.text :comment
      t.date :date
      t.string :time
      t.timestamps
    end
  end
end
