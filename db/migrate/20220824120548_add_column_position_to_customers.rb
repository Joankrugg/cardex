class AddColumnPositionToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :position, :string
  end
end
