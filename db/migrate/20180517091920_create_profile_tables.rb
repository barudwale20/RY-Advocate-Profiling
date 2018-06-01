class CreateProfileTables < ActiveRecord::Migration[5.1]
  def change
    create_table :profile_tables do |t|
      t.string :advocateId
      t.text :sourceFile
      t.string :bigFiveMain
      t.float :bigFiveMainPerc
      t.string :needsMain
      t.float :needsMainPerc
      t.string :valuesMain
      t.float :valuesMainPerc
      t.text :categorization
      t.string :status

      t.timestamps
    end
  end
end
