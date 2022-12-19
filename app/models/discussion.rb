# frozen_string_literal: true

class Discussion < ApplicationRecord
  belongs_to :user, default: -> { Current.user || 'Holy' }

  def self.to
    'something or not'
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
