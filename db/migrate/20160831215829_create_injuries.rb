class CreateInjuries < ActiveRecord::Migration
  def change
    create_table :injuries do |t|
      t.string :first_name
      t.string :last_name
      t.string :sport
      t.string :status
      t.string :injury_location
      t.text :therapy
      t.text :message
      t.date :date
      t.string :time
    end
  end
end
