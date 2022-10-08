class AddColumnLastVisitToBrindosCustomer < ActiveRecord::Migration[6.0]
  def change
    add_column :brindos_customers, :last_visit, :datetime
  end
end
