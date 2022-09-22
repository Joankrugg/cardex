class AddHomeReferenceToRabaProCustomers < ActiveRecord::Migration[6.0]
  def change
    add_reference :raba_pro_customers, :home, foreign_key: true
  end
end
