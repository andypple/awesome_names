class AddViewedAtToNameLists < ActiveRecord::Migration[6.1]
  def change
    add_column :name_lists, :viewed_at, :datetime, null: false
  end
end
