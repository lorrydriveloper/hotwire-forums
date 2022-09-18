# frozen_string_literal: true

class MainController < ApplicationController
  def index
    flash.now[:notice] = 'hello'
    flash.now[:alert] = 'Error'
  end
end
