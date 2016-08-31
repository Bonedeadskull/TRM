class CreateInjuries < ActiveRecord::Migration
  def change
    create_table :injuries do |t|
      t.string :first_name
      t.string :last_name
      t.string :injury_type
      t.date :start_date
      t.date :end_date
    end
  end
end
