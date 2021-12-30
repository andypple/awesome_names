module Api
  class BabyNamesController < ActionController::API
    def create
      baby_name = BabyName.create(create_params)
      if baby_name.save
        render json: baby_name, status: :created
      else
        render json: { error: baby_name.errors.full_messages.to_sentence }, status: :unprocessable_entity
      end
    end

    private

    def create_params
      params.require(:baby_name).permit(:name, :name_list_id)
    end
  end
end
