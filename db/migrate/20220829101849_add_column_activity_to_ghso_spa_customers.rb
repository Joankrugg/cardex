class AddColumnActivityToGhsoSpaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :ghso_spa_customers, :activity, :string
  end
end
