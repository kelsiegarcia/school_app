class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :size
      t.string :subject
      t.belongs_to :school

      t.timestamps null: false
    end
  end
end
