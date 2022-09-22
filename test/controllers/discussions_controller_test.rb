# frozen_string_literal: true

require 'test_helper'

class DiscussionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test 'should get index if authenticated' do
    sign_in users(:one)
    get discussions_url
    assert_response :success
  end
  test 'should redirect to login if user not authenticated' do
    get discussions_url
    assert_response :redirect
  end

  test 'it should display Discussions' do
    sign_in users(:one)
    get discussions_url
    discussion = discussions(:one)
    assert_select 'div.discussion', { count: discussions.count }
    assert_select "div##{dom_id(discussion)}", count: 1,
      text: /Pinned: #{discussion.pinned} \| Closed: #{discussion.close}/ do
      assert_select 'h2', count: 1, text: discussion.name
    end
  end

  test 'If not discussions display message' do
    sign_in users(:one)
    Discussion.delete_all
    get discussions_url
    assert_select 'div.discussion', { count: 0 }
    assert_select '#discussions', text: 'No discussions Yet'
  end
end
