class NameListsController < ApplicationController
  before_action :set_name_list

  def index; end
  def show
    @name_list&.touch(:viewed_at) # rubocop:disable Rails/SkipsModelValidations
    render json: {}
  end

  private

  def set_name_list
    @name_list = NameList.find_by(uid: params[:name_list_id])
  end
end
