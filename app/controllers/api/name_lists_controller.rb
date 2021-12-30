module Api
  class NameListsController < ActionController::API
    def show
      record = NameList.find_by(uid: params[:id])
      render json: record, include: [:baby_names]
    end
  end
end
