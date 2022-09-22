class AddPositionToBrindosProCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :brindos_pro_customers, :position, :string
  end
end
