# frozen_string_literal: true

class Discussion < ApplicationRecord
  belongs_to :user, default: -> { Current.user }

  def self.to
    'something'
  end

  validates :name, presence: true

  def other_thing
    '4'
  end
end
