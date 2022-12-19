# frozen_string_literal: true

class Discussion < ApplicationRecord
  belongs_to :user, default: -> { Current.user || nil }

  validates :name, presence: true
end
