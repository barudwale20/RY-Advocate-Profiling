# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180517104927) do

  create_table "big_five_tables", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "advocateId"
    t.string "bigFiveMain"
    t.float "bigFiveMainPerc", limit: 24
    t.float "openness", limit: 24
    t.float "conscientiousness", limit: 24
    t.float "extroversion", limit: 24
    t.float "agreeableness", limit: 24
    t.float "emotionalRange", limit: 24
    t.float "adventurousness", limit: 24
    t.float "artisticInterests", limit: 24
    t.float "emotionality", limit: 24
    t.float "imagination", limit: 24
    t.float "intellect", limit: 24
    t.float "authorityChallenging", limit: 24
    t.float "achievementStriving", limit: 24
    t.float "cautiousness", limit: 24
    t.float "dutifulness", limit: 24
    t.float "orderliness", limit: 24
    t.float "selfDiscipline", limit: 24
    t.float "selfEfficacy", limit: 24
    t.float "activityLevel", limit: 24
    t.float "assertiveness", limit: 24
    t.float "cheerfulness", limit: 24
    t.float "excitementSeeking", limit: 24
    t.float "outgoing", limit: 24
    t.float "gregariousness", limit: 24
    t.float "altruism", limit: 24
    t.float "cooperation", limit: 24
    t.float "modesty", limit: 24
    t.float "uncompromising", limit: 24
    t.float "sympathy", limit: 24
    t.float "trust", limit: 24
    t.float "fiery", limit: 24
    t.float "proneToWorry", limit: 24
    t.float "melancholy", limit: 24
    t.float "immoderation", limit: 24
    t.float "selfConsciousness", limit: 24
    t.float "susceptibleToStress", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "needs_tables", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "advocateId"
    t.string "needsMain"
    t.float "needsMainPerc", limit: 24
    t.float "structure", limit: 24
    t.float "stability", limit: 24
    t.float "selfExpression", limit: 24
    t.float "practicality", limit: 24
    t.float "love", limit: 24
    t.float "liberty", limit: 24
    t.float "ideal", limit: 24
    t.float "harmony", limit: 24
    t.float "excitement", limit: 24
    t.float "curiosity", limit: 24
    t.float "closeness", limit: 24
    t.float "challenge", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profile_tables", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "advocateId"
    t.text "sourceFile"
    t.string "bigFiveMain"
    t.float "bigFiveMainPerc", limit: 24
    t.string "needsMain"
    t.float "needsMainPerc", limit: 24
    t.string "valuesMain"
    t.float "valuesMainPerc", limit: 24
    t.text "categorization"
    t.datetime "lastUpdated"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "values_tables", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "advocateId"
    t.float "valuesMain", limit: 24
    t.float "valuesMainPerc", limit: 24
    t.float "selfTranscendence", limit: 24
    t.float "selfEnhancement", limit: 24
    t.float "hedonism", limit: 24
    t.float "opennessToChange", limit: 24
    t.float "conservation", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
