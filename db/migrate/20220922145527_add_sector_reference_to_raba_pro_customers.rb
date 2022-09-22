class AddSectorReferenceToRabaProCustomers < ActiveRecord::Migration[6.0]
  def change
    add_reference :raba_pro_customers, :sector, foreign_key: true
  end
end
