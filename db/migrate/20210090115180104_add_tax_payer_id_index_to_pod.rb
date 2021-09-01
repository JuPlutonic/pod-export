class AddTaxPayerIdIndexToPod < ActiveRecord::Migration[5.2]
  def change
    add_index :pods, :tax_payer_id, unique: true
  end
end
