class SetDefaultResolvedToMarker < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:markers, :resolved, false)
  end
end
