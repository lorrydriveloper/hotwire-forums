# frozen_string_literal: true

class Discussion < ApplicationRecord
  belongs_to :user, default: -> { Current.user }

  validates :name, presence: true, length: { maximum: 50 }

  def discussion_topic
    'Topic'
  end
end
