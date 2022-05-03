class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :end_date, presence: true
  validates :status, presence: true

  scope :get_search_title, -> (title_search){
    return if title_search.blank?
    where(['title LIKE ?',"%#{title_search}%"])
  }

  scope :get_search_status, ->(status_search){
    return if status_search.blank?
    where(status: status_search)
  }

  scope :get_search_result, -> (title_search, status_search){
    get_search_title(title_search).get_search_status(status_search)
  }
end
