class AddColumnBirthToRabaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_customers, :birth, :string
  end
end
