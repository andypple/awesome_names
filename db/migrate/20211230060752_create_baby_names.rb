class CreateBabyNames < ActiveRecord::Migration[6.1]
  def change
    enable_extension :citext

    create_table :baby_names do |t|
      t.citext :name
      t.references :name_list

      t.timestamps
    end
    add_index :baby_names, %i[name_list_id name], unique: true
  end
end
