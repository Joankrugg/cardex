class AddColumnRabaSpaFirstVisitToRabaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_customers, :raba_spa_first_visit, :datetime
  end
end
