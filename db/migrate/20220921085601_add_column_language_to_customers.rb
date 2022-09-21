class AddColumnLanguageToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :language, :string
  end
end
