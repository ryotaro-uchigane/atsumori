class User < ApplicationRecord
  # userが削除されたらentrysheetも削除されるように設定
  has_one :entrysheet, dependent: :destroy
  belongs_to :event
end
