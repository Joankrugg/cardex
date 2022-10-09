class AddColumnLastVisitToRabaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_customers, :last_visit, :datetime
  end
end
