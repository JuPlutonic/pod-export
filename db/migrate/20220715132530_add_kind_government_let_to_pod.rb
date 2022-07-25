class AddKindGovernmentLetToPod < ActiveRecord::Migration[7.0]
  def change
    add_column :pods, :kind, :string
    add_column :pods, :government_led, :boolean, default: false
    add_index :pods, :government_led, name: 'index_pods_on_government_led'
  end
end
