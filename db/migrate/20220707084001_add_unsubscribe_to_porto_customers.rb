class AddUnsubscribeToPortoCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :porto_customers, :unsubscribe, :boolean, default: false
  end
end
