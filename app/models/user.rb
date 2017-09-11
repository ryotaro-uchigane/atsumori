class User < ApplicationRecord
  # userが削除されたらentrysheetも削除されるように設定
  has_one :entrysheet, dependent: :destroy
  has_many :events
  has_many :followings, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6 }
  validates :role, presence: true, inclusion: { in: %w(job_hunting company)}
end
