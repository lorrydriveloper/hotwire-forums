# frozen_string_literal: true

require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get root_url
    assert_response :success
  end

  test 'should display flash messages' do
    get root_url
    assert_select '.alert-info', text: 'hello'
    assert_select '.alert-warning', text: 'Error'
  end
end
