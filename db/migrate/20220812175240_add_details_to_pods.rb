class AddDetailsToPods < ActiveRecord::Migration[7.0]
  def change
    add_column :pods, :short_name, :string
    add_column :pods, :site, :string
    add_column :pods, :dataset_url, :string
    add_column :pods, :oktmo, :string
  end
end
