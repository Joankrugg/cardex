class RenameColumnLastVisitInMegeveCustomers < ActiveRecord::Migration[6.0]
  def change
    rename_column :megeve_customers, :last_visit, :megeve_last_visit
  end
end
