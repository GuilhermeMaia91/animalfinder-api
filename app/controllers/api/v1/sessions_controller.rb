class Api::V1::SessionsController < ApplicationController
	skip_before_action :verify_authenticity_token
	skip_before_action :authorized

    def login
		@owner = Owner.find_by(email: params[:email].downcase)
		
		if @owner && @owner.authenticate(params[:password])
            @token = encode_token(owner_id: @owner.id)
            
			render json: {status: 200, message: 'Usuário autenticado com sucesso!', data:@owner, token: @token},status: :ok
		else
			render json: {status: 400, message: 'Usuário e senha incorretos!', data:@owner.errors},status:  :unprocessable_entity
		end
    end
    
	def signup
		@owner = Owner.new(require_params)

		if @owner.save
			render json: {status: 200, message: 'Cadastrado realizado com sucesso!', data:@owner},status: :ok
		else
			render json: {status: 400, message: 'Erro ao realizar o cadastro!', data:@owner.errors},status: :unprocessable_entity
		end
	end

	def listAnimals
        @animals = Animal.where("status in ('PERDIDO','COMUNICADO')")

        if @animals.any?
            render json: {status: 200, data:@animals},status: :ok
        else
            render json: {status: 400, data:[]},status: :unprocessable_entity
        end
	end

	def listLostAnimals
        @animals = Animal.where("status = 'PERDIDO'")

        if @animals.any?
            render json: {status: 200, data:@animals},status: :ok
        else
            render json: {status: 400, data:[]},status: :unprocessable_entity
        end
	end
	
	def found
        @animalFound = AnimalFound.new(found_params)

        if @animalFound.save
            @animal = @animalFound.animal
            @animal.status = "COMUNICADO"
            if @animal.save
                render json: {status: 200, message: 'Status do anuncio alterado para Comunicado.', data:@animalFound},status: :ok
            else
                render json: {status: 400, message: 'Não foi possível atualizar a informação do animal!', data:@animal.errors},status:  :unprocessable_entity
            end
        else
            render json: {status: 400, message: 'Não foi possível incluir a informação!', data:@animalFound.errors},status:  :unprocessable_entity
        end
    end
	
	private
	
	def require_params
		params.permit(:name, :email, :celfone, :password, :password_confirmation)
	end

	def found_params
        params.permit(:name, :phone, :animal_id)
    end
end