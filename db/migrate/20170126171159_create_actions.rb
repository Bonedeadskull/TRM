class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.action :string

      t.timestamps null: false
    end
  end
end
