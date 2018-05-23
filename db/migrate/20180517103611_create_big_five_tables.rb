class CreateBigFiveTables < ActiveRecord::Migration[5.1]
  def change
    create_table :big_five_tables do |t|
      t.string :advocateId
      t.string :bigFiveMain
      t.float :bigFiveMainPerc
      t.float :openness
      t.float :conscientiousness
      t.float :extroversion
      t.float :agreeableness
      t.float :emotionalRange
      t.float :adventurousness
      t.float :artisticInterests
      t.float :emotionality
      t.float :imagination
      t.float :intellect
      t.float :authorityChallenging
      t.float :achievementStriving
      t.float :cautiousness
      t.float :dutifulness
      t.float :orderliness
      t.float :selfDiscipline
      t.float :selfEfficacy
      t.float :activityLevel
      t.float :assertiveness
      t.float :cheerfulness
      t.float :excitementSeeking
      t.float :outgoing
      t.float :gregariousness
      t.float :altruism
      t.float :cooperation
      t.float :modesty
      t.float :uncompromising
      t.float :sympathy
      t.float :trust
      t.float :fiery
      t.float :proneToWorry
      t.float :melancholy
      t.float :immoderation
      t.float :selfConsciousness
      t.float :susceptibleToStress

      t.timestamps
    end
  end
end
