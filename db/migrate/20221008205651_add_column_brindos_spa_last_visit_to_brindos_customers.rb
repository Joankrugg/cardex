class AddColumnBrindosSpaLastVisitToBrindosCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :brindos_customers, :brindos_spa_last_visit, :datetime
  end
end
