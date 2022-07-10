class AddUnsubscribeToTheouleCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :theoule_customers, :unsubscribe, :boolean, default: false
  end
end
