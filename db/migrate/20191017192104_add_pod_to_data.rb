class AddPodToData < ActiveRecord::Migration[5.2]
  def change
    add_belongs_to :data, :pod, foreign_key: :tax_payer_id
  end
end
