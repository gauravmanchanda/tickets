class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.integer :customer_id
      t.integer :agent_id
      t.string :aasm_state

      t.timestamps
    end
  end
end
