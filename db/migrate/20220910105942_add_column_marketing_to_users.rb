class AddColumnMarketingToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :marketing, :boolean, null: false, default: false
  end
end
