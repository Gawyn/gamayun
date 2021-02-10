class AddRoleToGamayunUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :gamayun_users, :role, :string
  end
end
