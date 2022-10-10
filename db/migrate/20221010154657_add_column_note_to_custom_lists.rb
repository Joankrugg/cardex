class AddColumnNoteToCustomLists < ActiveRecord::Migration[6.0]
  def change
    add_column :custom_lists, :note, :string
  end
end
