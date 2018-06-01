class CreateCrystalTables < ActiveRecord::Migration[5.1]
  def change
    create_table :crystal_tables do |t|
      t.string :advocateId
      t.text :sourceFile
      t.string :crystalId
      t.string :discType
      t.float :confidence
      t.text :discImage
      t.text :personalityOverview
      t.text :personalityQualities
      t.text :likelyMotivations
      t.text :likelyBehaviors
      t.text :emailing
      t.text :communication
      t.text :buildingTrust
      t.text :selling
      t.text :workingTogether
      t.string :status

      t.timestamps
    end
  end
end
