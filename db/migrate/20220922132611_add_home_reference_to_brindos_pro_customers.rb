class AddHomeReferenceToBrindosProCustomers < ActiveRecord::Migration[6.0]
  def change
    add_reference :brindos_pro_customers, :home, foreign_key: true
  end
end
