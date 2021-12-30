class ApplicationController < ActionController::Base
  before_action :auto_login

  private

  def auto_login
    return if session[:name_list_id].present?

    session[:name_list_id] = SecureRandom.base58(12)
    redirect_to '/12_new_chars_uid'
  end
end
