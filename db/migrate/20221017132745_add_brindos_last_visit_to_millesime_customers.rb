class AddBrindosLastVisitToMillesimeCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :millesime_customers, :brindos_last_visit, :datetime
  end
end
