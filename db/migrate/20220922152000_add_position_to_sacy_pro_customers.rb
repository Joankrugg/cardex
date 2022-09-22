class AddPositionToSacyProCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :sacy_pro_customers, :position, :string
  end
end
