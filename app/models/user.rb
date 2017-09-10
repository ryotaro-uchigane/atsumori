class User < ApplicationRecord
  # userが削除されたらentrysheetも削除されるように設定
  has_one :entrysheet, dependent: :destroy
  has_many :events
  has_many :followings, dependent: :destroy
end
