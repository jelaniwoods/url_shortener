class AddUserReferenceToUrls < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :urls, :users
    add_index :urls, :user_id
    change_column_null :urls, :user_id, false
  end
end
