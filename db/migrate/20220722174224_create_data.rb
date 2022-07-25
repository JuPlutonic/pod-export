class CreateData < ActiveRecord::Migration[6.1]
  def change
    create_table :data do |t|
      t.string :mime
      t.date :date
      t.boolean :converted
      t.string :author
      t.string :source
      t.string :gov_code, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :data,
              :gov_code,
              name: 'index_data_on_gov_code'
  end
end
