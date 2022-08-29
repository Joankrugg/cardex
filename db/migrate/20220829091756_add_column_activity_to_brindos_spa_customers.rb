class AddColumnActivityToBrindosSpaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :brindos_spa_customers, :activity, :string
  end
end
