class AddPhoneToSacySpaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :sacy_spa_customers, :phone, :string
  end
end
