class CreateVoters < ActiveRecord::Migration[6.1]
  def change
    create_table :voters do |t|
      t.references :user, null: false, foreign_key: true
      t.references :marker, null: false, foreign_key: true
      t.integer :vote

      t.timestamps
    end
  end
end
