class CreateMarkers < ActiveRecord::Migration[6.1]
  def change
    create_table :markers do |t|
      t.string :disaster_type
      t.decimal :latitude
      t.decimal :longitude
      t.string :obs
      t.references :user, null: false, foreign_key: true
      t.integer :upvotes, default: 0
      t.integer :downvotes, default: 0
      t.boolean :verified, default: false

      t.timestamps
    end
  end
end
