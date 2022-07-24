class AddDatumToJsonDataset < ActiveRecord::Migration[5.2]
  def change
    add_reference :json_datasets, :datum, foreign_key: true
  end
end
