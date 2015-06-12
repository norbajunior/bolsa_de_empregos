class RemoveBackofficeFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :backoffice
  end
end
