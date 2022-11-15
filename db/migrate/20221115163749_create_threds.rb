class CreateThreds < ActiveRecord::Migration[6.1]
  def change
    create_table :threds do |t|
      t.references :bbs
      t.text       :text, null:false

      t.timestamps
    end
  end
end
