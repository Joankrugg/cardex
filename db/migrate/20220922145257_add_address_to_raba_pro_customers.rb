class AddAddressToRabaProCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_pro_customers, :address, :string
  end
end
