class AddSectorReferenceToBrindosProCustomers < ActiveRecord::Migration[6.0]
  def change
    add_reference :brindos_pro_customers, :sector, foreign_key: true
  end
end
