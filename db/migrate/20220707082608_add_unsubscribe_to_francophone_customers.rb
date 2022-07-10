class AddUnsubscribeToFrancophoneCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :francophone_customers, :unsubscribe, :boolean, default: false
  end
end
