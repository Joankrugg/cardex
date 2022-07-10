class AddUnsubscribeToSacyCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :sacy_customers, :unsubscribe, :boolean, default: false
  end
end
