class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.integer :interested_id, index: true
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
