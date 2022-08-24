class AddColumnZipcodeToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :zipcode, :string
  end
end
