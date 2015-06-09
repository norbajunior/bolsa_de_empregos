class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.date :date
      t.text :summary
      t.text :text
      t.string :image
      t.boolean :featured
      t.boolean :active
      t.references :user, index: true
      t.foreign_key :users

      t.timestamps
    end
  end
end
