class AddColumnCountryToRabaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_customers, :country, :string
  end
end
