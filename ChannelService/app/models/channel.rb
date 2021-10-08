class Channel < ApplicationRecord
  validates :channel_name, presence: true
end
