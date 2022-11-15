class CreateThredComments < ActiveRecord::Migration[6.1]
  def change
    create_table :thred_comments do |t|
      t.references :thred
      t.text       :text, null:false

      t.timestamps
    end
  end
end
