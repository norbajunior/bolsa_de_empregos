class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :offer_id, index: true
      t.integer :candidate_id, index: true
      t.foreign_key :offers
      t.foreign_key :users, column: :candidate_id

      t.timestamps
    end
  end
end
