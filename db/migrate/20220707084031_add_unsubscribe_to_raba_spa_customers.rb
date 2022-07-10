class AddUnsubscribeToRabaSpaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_spa_customers, :unsubscribe, :boolean, default: false
  end
end
