class AddUnsubscribeToSacySpaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :sacy_spa_customers, :unsubscribe, :boolean, default: false
  end
end
