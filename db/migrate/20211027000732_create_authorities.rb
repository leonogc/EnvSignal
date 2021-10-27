class CreateAuthorities < ActiveRecord::Migration[6.1]
  def change
    create_table :authorities do |t|
      t.integer :identifier
      t.string :password_digest
      t.string :name

      t.timestamps
    end
  end
end
