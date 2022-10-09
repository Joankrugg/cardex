class AddColumnRabaSpaLastVisitToRabaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_customers, :raba_spa_last_visit, :datetime
  end
end
