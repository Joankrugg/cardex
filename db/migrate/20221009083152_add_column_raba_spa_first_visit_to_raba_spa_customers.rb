class AddColumnRabaSpaFirstVisitToRabaSpaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_spa_customers, :raba_spa_first_visit, :datetime
  end
end
