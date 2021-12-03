class ChangeIdentifierAuthority < ActiveRecord::Migration[6.1]
  def change
    change_column :authorities, :identifier, :bigint
  end
end
