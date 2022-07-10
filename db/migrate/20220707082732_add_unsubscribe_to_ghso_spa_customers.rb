class AddUnsubscribeToGhsoSpaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :ghso_spa_customers, :unsubscribe, :boolean, default: false
  end
end
