class CreateImpresssions < ActiveRecord::Migration
  def change
    create_table :impresssions do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

