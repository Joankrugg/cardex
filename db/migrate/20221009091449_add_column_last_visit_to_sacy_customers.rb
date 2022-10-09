class AddColumnLastVisitToSacyCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :sacy_customers, :last_visit, :datetime
  end
end
