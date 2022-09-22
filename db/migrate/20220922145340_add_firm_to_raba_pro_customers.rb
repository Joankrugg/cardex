class AddFirmToRabaProCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_pro_customers, :firm, :string
  end
end
