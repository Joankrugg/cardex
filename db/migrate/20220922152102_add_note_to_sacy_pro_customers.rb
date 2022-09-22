class AddNoteToSacyProCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :sacy_pro_customers, :note, :string
  end
end
