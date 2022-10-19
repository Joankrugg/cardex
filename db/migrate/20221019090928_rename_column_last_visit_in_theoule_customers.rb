class RenameColumnLastVisitInTheouleCustomers < ActiveRecord::Migration[6.0]
  def change
    rename_column :theoule_customers, :last_visit, :theoule_last_visit
  end
end
