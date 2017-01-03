class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :first_name
      t.string :last_name
      t.string :dob
      t.integer :grade
      t.string :phone
      t.string :address
      t.string :sport
    end
  end
end
