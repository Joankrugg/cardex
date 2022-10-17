class AddLeognanLastVisitToMillesimeCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :millesime_customers, :leognan_last_visit, :datetime
  end
end
