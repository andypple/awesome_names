class NameList < ApplicationRecord
  scope :most_recently_view, -> { order(viewed_at: :desc).first }
end
