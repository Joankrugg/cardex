class AddColumnTypeNameToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :type_name, :string
  end
end
