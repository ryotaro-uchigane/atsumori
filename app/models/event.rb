class Event < ApplicationRecord
  has_many :documents
  has_many :users
end
