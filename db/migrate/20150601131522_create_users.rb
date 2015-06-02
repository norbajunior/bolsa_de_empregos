class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name,            null: false
      t.string :email,           null: false
      t.string :password_digest, null: false
      t.text :address
      t.string :zipcode
      t.string :place
      t.string :contact
      t.string :other_contact
      t.string :site
      t.integer :nif
      t.string :professional_activity
      t.text :presentation

      t.timestamps
    end
  end
end
