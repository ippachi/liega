# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def current_user_code = session[:current_user_code]
end
