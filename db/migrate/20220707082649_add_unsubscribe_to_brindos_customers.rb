class AddUnsubscribeToBrindosCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :brindos_customers, :unsubscribe, :boolean, default: false
  end
end
