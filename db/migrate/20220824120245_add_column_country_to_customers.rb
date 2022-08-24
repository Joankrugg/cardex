class AddColumnCountryToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :country, :string
  end
end
