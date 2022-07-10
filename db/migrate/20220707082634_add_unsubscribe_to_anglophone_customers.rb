class AddUnsubscribeToAnglophoneCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :anglophone_customers, :unsubscribe, :boolean, default: false
  end
end
