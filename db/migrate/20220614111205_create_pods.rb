class CreatePods < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :pods do |t|
      t.string :organization
      t.string :tax_payer_id
      t.uuid :pod_code, null: false, default: -> { 'gen_random_uuid()' }

      t.timestamps
    end
  end
end
