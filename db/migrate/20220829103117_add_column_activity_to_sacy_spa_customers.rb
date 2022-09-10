class AddColumnActivityToSacySpaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :sacy_spa_customers, :activity, :string
  end
end
