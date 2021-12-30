module Api
  class BabyNamesController < ActionController::API
    before_action :trim_name!

    def create
      baby_name = BabyName.create(create_params)
      if baby_name.save
        render json: baby_name, status: :created
      else
        render json: { error: baby_name.errors.full_messages.to_sentence }, status: :unprocessable_entity
      end
    end

    private

    def trim_name!
      create_params[:name] = create_params[:name]&.strip
    end

    def create_params
      @create_params ||= params.require(:baby_name).permit(:name, :name_list_id)
    end
  end
end
