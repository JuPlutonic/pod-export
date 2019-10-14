class CreateJsonDatasets < ActiveRecord::Migration[5.0]
  def change
    create_table :json_datasets do |t|
      t.binary 'files', null: false, default: []
      t.jsonb 'jsonb', null: false, default: {}

      t.timestamps
    end
  end
end
