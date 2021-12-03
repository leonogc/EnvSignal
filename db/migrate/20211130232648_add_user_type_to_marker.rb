class AddUserTypeToMarker < ActiveRecord::Migration[6.1]
  def change
    add_column :markers, :user_type, :integer
  end
end
