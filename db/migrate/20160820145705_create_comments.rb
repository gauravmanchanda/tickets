class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :author_id
      t.text :body
      t.integer :ticket_id

      t.timestamps
    end
  end
end
