class AddAddressToSacyProCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :sacy_pro_customers, :address, :string
  end
end
