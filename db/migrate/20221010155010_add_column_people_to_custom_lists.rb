class AddColumnPeopleToCustomLists < ActiveRecord::Migration[6.0]
  def change
    add_column :custom_lists, :people, :integer
  end
end
