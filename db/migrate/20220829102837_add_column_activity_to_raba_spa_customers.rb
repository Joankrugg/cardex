class AddColumnActivityToRabaSpaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_spa_customers, :activity, :string
  end
end
