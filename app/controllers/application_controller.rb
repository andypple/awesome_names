class ApplicationController < ActionController::Base
  before_action :auto_login
  before_action :check_name_list_id

  private

  def check_name_list_id
    return if params[:name_list_id].present?

    redirect_to '/most_recently_view_uid'
  end

  def auto_login
    return if session[:name_list_id].present?

    session[:name_list_id] = SecureRandom.base58(12)
    redirect_to "/#{new_name_list.uid}"
  end

  def new_name_list
    NameList.create(uid: SecureRandom.base58(12))
  end
end
