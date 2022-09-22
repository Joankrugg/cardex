class AddLanguageToBrindosProCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :brindos_pro_customers, :language, :string
  end
end
