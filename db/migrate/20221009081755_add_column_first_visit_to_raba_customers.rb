class AddColumnFirstVisitToRabaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_customers, :first_visit, :datetime
  end
end
