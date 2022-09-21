class AddColumnFirmToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :firm, :string
  end
end
