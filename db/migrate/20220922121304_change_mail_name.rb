class ChangeMailName < ActiveRecord::Migration[6.0]
  def change
    rename_column :customers, :mail, :email
  end
end
