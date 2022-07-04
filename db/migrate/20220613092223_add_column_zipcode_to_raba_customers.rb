class AddColumnZipcodeToRabaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_customers, :zipcode, :string
  end
end
