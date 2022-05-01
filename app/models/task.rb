class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :end_date, presence: true
end
