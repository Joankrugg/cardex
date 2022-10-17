class AddLeognanSpaLastVisitToMillesimeCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :millesime_customers, :leognan_spa_last_visit, :datetime
  end
end
