class AddFirstTimeToMillesimeCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :millesime_customers, :first_time, :boolean
  end
end
