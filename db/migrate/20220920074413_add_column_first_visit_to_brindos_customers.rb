class AddColumnFirstVisitToBrindosCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :brindos_customers, :first_visit, :datetime
  end
end
