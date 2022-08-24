class AddColumnSurnameToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :surname, :string
  end
end
