class CreateValuesTables < ActiveRecord::Migration[5.1]
  def change
    create_table :values_tables do |t|
      t.string :advocateId
      t.float :valuesMain
      t.float :valuesMainPerc
      t.float :selfTranscendence
      t.float :selfEnhancement
      t.float :hedonism
      t.float :opennessToChange
      t.float :conservation

      t.timestamps
    end
  end
end
