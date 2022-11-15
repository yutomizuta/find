class CreateBbses < ActiveRecord::Migration[6.1]
  def change
    create_table :bbses do |t|
      t.string     :university_name, null:false

      t.timestamps
    end
  end
end
