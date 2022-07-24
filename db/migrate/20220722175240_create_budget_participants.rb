class CreateBudgetParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :budget_participants do |t|
      t.string :name
      t.string :short_name
      t.string :tax_payer_id
      t.boolean :status
      t.string :budg_code
      t.string :gov_code, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :budget_participants, :budg_code, unique: true
    add_index :budget_participants,
              :gov_code,
              name: 'index_budget_participants_on_gov_code'
  end
end
