class RemoveColumnTypeNameFromCustomers < ActiveRecord::Migration[6.0]
  def change
    remove_column :customers, :type_name, :string
  end
end
