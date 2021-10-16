class CreateMarkers < ActiveRecord::Migration[6.1]
  def change
    create_table :markers do |t|
      t.string :type
      t.decimal :latitude
      t.decimal :longitude
      t.string :obs
      t.references :user, null: false, foreign_key: true
      t.integer :upvotes
      t.integer :downvotes
      t.boolean :verified

      t.timestamps
    end
  end
end
