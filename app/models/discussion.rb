# frozen_string_literal: true

class Discussion < ApplicationRecord
  belongs_to :user, default: -> { Current.user || 'Holy-sit-2' }

  def self.to
    'something'
  end

  validates :name, presence: true, length: { maximum: 50 }

  def discussion_topic
    'Topic'
  end

  def bla
    'bli'
  end

  def other_thing
    '4'
  end
end
