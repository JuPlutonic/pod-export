class AddPodToData < ActiveRecord::Migration[5.0]
  def change
    add_reference :data, :pod, foreign_key: true
  end
end
