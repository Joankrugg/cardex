class AddColumnRabaSpaLastVisitToRabaSpaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_spa_customers, :raba_spa_last_visit, :datetime
  end
end
