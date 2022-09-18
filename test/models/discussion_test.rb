# frozen_string_literal: true

require 'test_helper'

class DiscussionTest < ActiveSupport::TestCase
  test 'Create a valid Discussion' do
    user = User.first
    Current.user = user
    discussion = Discussion.new(name: 'new discussion')
    assert discussion.valid?
  end

  test 'Fail to create user without user' do
    discussion = Discussion.new(name: 'new discussion')
    assert_not discussion.valid?
  end
end
