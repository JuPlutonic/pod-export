class CreateJsonDatasets < ActiveRecord::Migration[7.0]
  def change
    create_table :json_datasets do |t|
      t.binary 'file'
      t.jsonb 'jsonb', null: false, default: {}

      t.timestamps
    end
  end
end
