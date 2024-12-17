class RenameUsersIdToUserIdInOrders < ActiveRecord::Migration[7.1]
  def change
    rename_column :orders, :users_id, :user_id
  end
end
