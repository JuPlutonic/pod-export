class AddDatumToJsonDataset < ActiveRecord::Migration[7.0]
  def change
    add_reference :json_datasets, :datum, foreign_key: true
  end
end
