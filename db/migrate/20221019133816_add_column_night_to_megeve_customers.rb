class AddColumnNightToMegeveCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :megeve_customers, :night, :integer
  end
end
