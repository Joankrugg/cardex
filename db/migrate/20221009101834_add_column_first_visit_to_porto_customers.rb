class AddColumnFirstVisitToPortoCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :porto_customers, :first_visit, :datetime
  end
end
