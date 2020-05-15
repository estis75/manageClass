class Classinfo < ApplicationRecord
  validates :th, presence: true
  validates :day, presence: true
  validates :url, presence: true
  validates :classname, presence: false
end
