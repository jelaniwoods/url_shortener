class ChangeRolesDefaultValueInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :roles, "free"
  end
end
