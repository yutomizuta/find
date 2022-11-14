class CreateTakenCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :taken_courses do |t|
      t.references :student
      t.string     :name,        null:false
      t.integer    :day_of_week, null:false
      t.integer    :period,      null:false

      t.timestamps
    end
  end
end
