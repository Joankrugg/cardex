class AddRabaLastVisitToMillesimeCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :millesime_customers, :raba_last_visit, :datetime
  end
end
