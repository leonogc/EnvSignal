class AddResolvedToMarker < ActiveRecord::Migration[6.1]
  def change
    add_column :markers, :resolved, :boolean
  end
end
