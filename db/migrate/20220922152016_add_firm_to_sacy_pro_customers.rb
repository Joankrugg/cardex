class AddFirmToSacyProCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :sacy_pro_customers, :firm, :string
  end
end
