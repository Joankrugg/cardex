class AddUnsubscribeToRabaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_customers, :unsubscribe, :boolean, default: false
  end
end
