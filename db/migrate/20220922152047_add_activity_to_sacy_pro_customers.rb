class AddActivityToSacyProCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :sacy_pro_customers, :activity, :string
  end
end
