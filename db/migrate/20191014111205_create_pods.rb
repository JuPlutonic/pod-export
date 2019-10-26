class CreatePods < ActiveRecord::Migration[5.2]
  def change
    create_table :pods do |t|
      t.string :organization
      t.string :tax_payer_id, null: false, unique: true
      t.timestamps
    end
  end
end
