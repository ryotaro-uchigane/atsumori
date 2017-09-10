class Entrysheet < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :sex, presence: true
  validates :public, inclusion: { in: [true, false] }
end
