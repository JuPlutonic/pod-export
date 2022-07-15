class AddPodToData < ActiveRecord::Migration[5.2]
  def change
    add_belongs_to :data, :pod, foreign_key: :gov_code
  end
end
