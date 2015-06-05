class AddFirstnameAndLastnameAndAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string, default: ""
    add_column :users, :lastname, :string, default: ""
    add_column :users, :admin, :boolean, default: false
  end
end
