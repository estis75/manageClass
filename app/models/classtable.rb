class Classtable < ApplicationRecord
  validates :th, presence: true
  validates :day, presence: true
  validates :key, presence: true
  validates :classid, presence: true
end
