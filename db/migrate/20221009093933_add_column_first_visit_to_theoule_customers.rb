class AddColumnFirstVisitToTheouleCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :theoule_customers, :first_visit, :datetime
  end
end
