class AddBrindosSpaLastVisitToMillesimeCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :millesime_customers, :brindos_spa_last_visit, :datetime
  end
end
