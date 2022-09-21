class AddColumnNoteToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :note, :string
  end
end
