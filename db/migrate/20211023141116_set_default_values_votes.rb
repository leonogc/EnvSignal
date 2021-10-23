class SetDefaultValuesVotes < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:markers, :upvotes, 0)
    change_column_default(:markers, :downvotes, 0)
    change_column_default(:markers, :verified, false)
  end
end
