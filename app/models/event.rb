class Event < ApplicationRecord
  has_many :documents
  belongs_to :user
end
