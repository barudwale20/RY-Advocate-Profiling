class CreateContactTables < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_tables do |t|
      t.string :advocateId
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :companyName
      t.string :location

      t.timestamps
    end
  end
end
