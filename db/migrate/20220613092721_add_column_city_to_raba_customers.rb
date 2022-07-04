class AddColumnCityToRabaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_customers, :city, :string
  end
end
