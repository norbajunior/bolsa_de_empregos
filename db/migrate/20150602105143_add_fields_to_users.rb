class AddFieldsToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.date    :date_of_birth
      t.string :identity_number
      t.string  :cv
      t.string  :professional_area
      t.string  :scholarity
      t.text    :education
      t.string  :employment_status
      t.text    :experience
      t.string :type
    end
  end
end
