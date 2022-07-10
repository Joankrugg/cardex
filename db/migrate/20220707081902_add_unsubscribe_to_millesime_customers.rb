class AddUnsubscribeToMillesimeCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :millesime_customers, :unsubscribe, :boolean, default: false
  end
end
