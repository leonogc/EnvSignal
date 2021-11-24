class RemoveVotesFromMarker < ActiveRecord::Migration[6.1]
  def change
    remove_column :markers, :upvotes, :integer
    remove_column :markers, :downvotes, :integer
  end
end
