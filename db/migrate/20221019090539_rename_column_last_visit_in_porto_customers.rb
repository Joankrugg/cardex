class RenameColumnLastVisitInPortoCustomers < ActiveRecord::Migration[6.0]
  def change
    rename_column :porto_customers, :last_visit, :porto_last_visit
  end
end
