class Api::V1::AnimalController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authorized

    def list
        @owner = current_user

        if @owner.animals.any?
            render json: {status: 200, data:@owner.animals},status: :ok
        else
            render json: {status: 204, data:[]},status: :unprocessable_entity
        end
    end

    def show
        @animal = Animal.find(params[:id])

        if !@animal.nil?
            render json: {status: 200, data:@animal},status: :ok
		else
			render json: {status: 204, message: 'Não foi possível localizar o animal!', data:@animal.errors},status: :unprocessable_entity
		end
    end

    def insert
        @animal = Animal.new(insert_params)
        
        if @animal.save
            render json: {status: 200, data:@animal.as_json},status: :ok
        else
            render json: {status: 400, message: 'Não foi possível atualizar as informações do animal!', data:@animal.errors},status:  :unprocessable_entity
        end
    end

    def edit
        @animal = Animal.find(params[:id])

        if @animal.update(update_params)
            render json: {status: 200, data:@animal},status: :ok
        else
            render json: {status: 400, message: 'Não foi possível atualizar as informações do animal!', data:@animal.errors},status:  :unprocessable_entity
        end
    end

    def delete
        @animal = Animal.find(params[:id])

        if @animal.destroy
            render json: {status: 200, message: 'Animal removido com sucesso!', data:[]},status: :ok
        else
            render json: {status: 400, message: 'Não foi possível remover as informações do do animal!', data:@animal.errors},status:  :unprocessable_entity
        end
    end

    def foundList
        @animal = Animal.where("id = ? and owner_id = ?", params[:id], current_user.id).first

        if @animal && @animal.animal_founds.any?
            render json: {status: 200, data:@animal.animal_founds},status: :ok
        else
            render json: {status: 400, message: 'Não foi possível encontrar os comunicados para esse animal!', data:[]},status: :unprocessable_entity
        end
    end

    private
    def insert_params
        params.permit(:name, :photo, :age, :extra_information, :city, :state, :status, :owner_id)
    end

    def update_params
        params.permit(:id, :name, :photo, :age, :extra_information, :city, :state, :status, :owner_id)
    end
end
