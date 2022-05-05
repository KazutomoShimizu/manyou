class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :end_date, presence: true
  validates :status, presence: true

  enum status: {未着手:1, 着手中:2, 完了:3}
  enum priority: {高:1, 中:2, 低:3}

  scope :create_desc, -> { order(create_at: :desc) }
  scope :search_title, -> (params_title){
    where("title LIKE ?", "%#{params_title}%")}
  scope :search_status, ->(params_status){
    where(status: params_status)}
  scope :priority_asc, -> { order(priority: :asc) }
end
