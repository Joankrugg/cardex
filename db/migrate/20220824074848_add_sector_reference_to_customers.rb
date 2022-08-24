class AddSectorReferenceToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_reference :customers, :sector, foreign_key: true
  end
end
