class RemoveColumnHomeFromBrindosProCustomer < ActiveRecord::Migration[6.0]
  def change
    remove_column :brindos_pro_customers, :home, :string
  end
end
