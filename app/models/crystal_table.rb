class CrystalTable < ApplicationRecord
  validates :advocateId, presence: true
  validates :sourceFile, presence: true
  validates :status, presence: true
end
