class AddColumnLastVisitToTheouleCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :theoule_customers, :last_visit, :datetime
  end
end
