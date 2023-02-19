# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def current_user_id = session[:current_user_id]
end
