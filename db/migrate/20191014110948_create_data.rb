class CreateData < ActiveRecord::Migration[5.2]
  def change
    create_table :data do |t|
      t.string :mime
      t.date :date
      t.boolean :converted
      t.string :author
      t.string :source

      t.timestamps
    end
  end
end
