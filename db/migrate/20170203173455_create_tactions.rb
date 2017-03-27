class CreateTactions < ActiveRecord::Migration
  def change
    create_table :tactions do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
