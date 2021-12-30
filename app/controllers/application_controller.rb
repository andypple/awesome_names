class ApplicationController < ActionController::Base
  before_action :auto_login
  before_action :check_name_list_id

  private

  def check_name_list_id
    return if params[:name_list_id].present?

    redirect_to "/#{NameList.most_recently_view.uid}"
  end

  def auto_login
    return if session[:name_list_id].present?

    session[:name_list_id] = SecureRandom.base58(12)
    redirect_to "/#{NameLists::Create.new.call.uid}"
  end
end
