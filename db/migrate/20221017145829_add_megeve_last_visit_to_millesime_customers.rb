class AddMegeveLastVisitToMillesimeCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :millesime_customers, :megeve_last_visit, :datetime
  end
end
