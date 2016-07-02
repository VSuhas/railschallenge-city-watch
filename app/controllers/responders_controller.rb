class RespondersController < ApplicationController

	rescue_from ActionController::UnpermittedParameters, with: :catch_unpermitted_params

	def create
		@responder = Responder.new(responder_params)  
		if @responder.save
			render json: { responder: @responder }, status: 201
		else
			render json: { message: @responder.errors }, status: 422
		end
	end

	def new
		render json: { message: 'page not found' }, status: 404
	end


	def edit
		render json: { message: 'page not found' }, status: 404
	end

	def destroy
		render json: { message: 'page not found' }, status: 404
	end


	private

	def responder_params
		params.require(:responder).permit(:type, :name, :capacity)
	end

	def catch_unpermitted_params
		render :json => { message: $ERROR_INFO.message }.to_json, :status => 422
	end


end