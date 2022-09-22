class AddStateToBrindosProCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :brindos_pro_customers, :state, :string
  end
end
