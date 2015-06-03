class AddBackofficeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :backoffice, :boolean, default: false
  end
end
