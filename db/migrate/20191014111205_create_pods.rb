class CreatePods < ActiveRecord::Migration[5.0]
  def change
    create_table :pods do |t|
      t.string :organization
       # Rails 5.1 maybe doesn't need limit/unique (primary_key's attributes)
       # and Rails 6.0 don't need 'activerecord-suppress_range_error' gem
       # if tax_payer_id's type is t.integer
      t.string :tax_payer_id, null: false, unique: true
      t.timestamps
    end
  end
end
