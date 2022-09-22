# frozen_string_literal: true

require 'test_helper'

class CrudDiscussionTest < ActionDispatch::SystemTestCase
  include Devise::Test::IntegrationHelpers
  include Capybara::DSL
  # Make `assert_*` methods behave like Minitest assertions
  include Capybara::Minitest::Assertions
  test 'should render a form' do
    sign_in users(:one)
    visit new_discussion_url
    assert_selector '#discussion_name'
    assert_selector '#discussion_pinned'
    assert_selector '#discussion_close'
    fill_in 'Name', with: 'Test Discussion'
    check 'Pinned'
    check 'Close'
    find('input[name="commit"]').click
    assert_text 'Test Discussion'
  end
end
