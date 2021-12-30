class NameListsController < ApplicationController
  before_action :set_name_list

  def index; end

  def show
    if @name_list.present?
      @name_list.touch(:viewed_at) # rubocop:disable Rails/SkipsModelValidations
    else
      redirect_to "/#{NameList.most_recently_view.uid}"
    end
  end

  private

  def set_name_list
    @name_list = NameList.find_by(uid: params[:name_list_id])
  end
end
