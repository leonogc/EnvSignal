class AddSeverityToMarker < ActiveRecord::Migration[6.1]
  def change
    add_column :markers, :severity, :integer
  end
end
