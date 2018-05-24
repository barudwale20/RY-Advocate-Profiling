class ProfileTable < ApplicationRecord
  validates :advocateId, presence: true
  validates :sourceFile, presence: true
  validates :status, presence: true
  validates :created_at, presence: true
  validates :updated_at, presence: true
end
