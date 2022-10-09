class AddColumnLastVisitToMegeveCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :megeve_customers, :last_visit, :datetime
  end
end
