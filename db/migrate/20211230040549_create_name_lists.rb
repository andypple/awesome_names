class CreateNameLists < ActiveRecord::Migration[6.1]
  def change
    create_table :name_lists do |t|
      t.string :uid, limit: 12, null: false

      t.timestamps
    end
    add_index :name_lists, :uid, unique: true
  end
end
