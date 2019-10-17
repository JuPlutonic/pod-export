class CreatePods < ActiveRecord::Migration[5.0]
  def change
    create_table :pods do |t|
      t.string :organization
      t.integer :tax_payers_id, null: false
      t.timestamps
    end
  end
end
