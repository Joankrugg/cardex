class AddUnsubscribeToMegeveCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :megeve_customers, :unsubscribe, :boolean, default: false
  end
end
