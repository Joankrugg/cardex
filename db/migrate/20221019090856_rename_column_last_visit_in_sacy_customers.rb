class RenameColumnLastVisitInSacyCustomers < ActiveRecord::Migration[6.0]
  def change
    rename_column :sacy_customers, :last_visit, :sacy_last_visit
  end
end
