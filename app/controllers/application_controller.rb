class ApplicationController < ActionController::Base
  # method to return the current user
  def current_user
    User.first
  end
end
