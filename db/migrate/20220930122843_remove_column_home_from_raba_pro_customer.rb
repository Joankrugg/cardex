class RemoveColumnHomeFromRabaProCustomer < ActiveRecord::Migration[6.0]
  def change
    remove_column :raba_pro_customers, :home, :string
  end
end
