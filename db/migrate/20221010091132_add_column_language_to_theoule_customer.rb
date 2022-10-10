class AddColumnLanguageToTheouleCustomer < ActiveRecord::Migration[6.0]
  def change
    add_column :theoule_customers, :language, :string
  end
end
