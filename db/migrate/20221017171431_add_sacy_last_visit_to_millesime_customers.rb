class AddSacyLastVisitToMillesimeCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :millesime_customers, :sacy_last_visit, :datetime
  end
end
