class AddColumnFirstVisitToSacyCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :sacy_customers, :first_visit, :datetime
  end
end
