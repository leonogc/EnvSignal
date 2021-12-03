class RemoveForeignKeyFromMarker < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :markers, name: "fk_rails_a7009bc2b6"
  end
end
