class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :population
      t.string :city
      t.string :state

      t.timestamps null: false
    end
  end
end
