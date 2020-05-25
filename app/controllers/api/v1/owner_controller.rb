class Api::V1::OwnerController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authorized

    def show
        @owner = current_user

        if !@owner.nil?
            render json: {status: 200, data:@owner},status: :ok
		else
			render json: {status: 500, message: 'Não foi possível localizar o proprietario!', data:@owner.errors},status:  :unprocessable_entity
		end
    end

    def edit
        @owner = current_user

        if @owner.update(update_params)
            render json: {status: 200, data:@owner},status: :ok
        else
            render json: {status: 500, message: 'Não foi possível atualizar as informações do proprietario!', data:@owner.errors},status:  :unprocessable_entity
        end
    end

    private
    def update_params
        params.permit(:name, :email, :celfone)
    end
end
