class CreateNeedsTables < ActiveRecord::Migration[5.1]
  def change
    create_table :needs_tables do |t|
      t.string :advocateId
      t.string :needsMain
      t.float :needsMainPerc
      t.float :structure
      t.float :stability
      t.float :selfExpression
      t.float :practicality
      t.float :love
      t.float :liberty
      t.float :ideal
      t.float :harmony
      t.float :excitement
      t.float :curiosity
      t.float :closeness
      t.float :challenge

      t.timestamps
    end
  end
end
