class AddColumnBrindosSpaFirstVisitToBrindosCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :brindos_customers, :brindos_spa_first_visit, :datetime
  end
end
