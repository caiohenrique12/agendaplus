# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(_resource)
    contacts_path
  end
end
