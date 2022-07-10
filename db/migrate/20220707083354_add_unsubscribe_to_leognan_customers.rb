class AddUnsubscribeToLeognanCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :leognan_customers, :unsubscribe, :boolean, default: false
  end
end
