class RemoveColumnHomeFromSacyProCustomer < ActiveRecord::Migration[6.0]
  def change
    remove_column :sacy_pro_customers, :home, :string
  end
end
