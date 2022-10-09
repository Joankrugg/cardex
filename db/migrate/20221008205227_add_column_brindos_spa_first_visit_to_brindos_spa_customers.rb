class AddColumnBrindosSpaFirstVisitToBrindosSpaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :brindos_spa_customers, :brindos_spa_first_visit, :datetime
  end
end
