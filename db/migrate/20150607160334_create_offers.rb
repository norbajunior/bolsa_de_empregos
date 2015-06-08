class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :title
      t.date :start_at
      t.date :end_at
      t.text :description
      t.string :photo
      t.integer :entity_id, null: false, index: true
      t.string :professional_activity
      t.string :contract
      t.boolean :active, default: false
      t.string :salary

      t.timestamps
    end

    add_foreign_key :offers, :users, column: :entity_id
  end
end
