class Event < ApplicationRecord
  has_many :documents
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true
  validates :description,
  validates :public, inclusion: { in: [true, false] }
end
