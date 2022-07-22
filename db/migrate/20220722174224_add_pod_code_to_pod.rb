class AddPodCodeToPod < ActiveRecord::Migration[5.2]
  def change
    add_column :pods, :pod_code, :uuid, null: false
    add_index :pods, :pod_code, name: 'index_pods_on_pod_code', unique: true
  end
end
