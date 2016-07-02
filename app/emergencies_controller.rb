class  EmergenciesController < ApplicationController

	def create 
		@emergency = Emergency.new(emergency_params)
		if @emergency.valid? && @emergency.save
			render json: { emergency: @emergency }, status: 201
		else
			render json: { message: @emergency.errors.messages }, status: 422
		end
	end

	def new
    render json: { message: 'page not found' }.to_json, status: 404
  end

  def edit
    render json: { message: 'page not found' }.to_json, status: 404
  end

  def destroy
    render json: { message: 'page not found' }.to_json, status: 404
  end


	private

	def emergency_params
		params.require(:emergency).permit(:code, :fire_severity, :police_severity, :medical_severity)
	end
end