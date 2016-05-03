class Admin::FreelancesController < ApplicationController
	layout 'admin'
	before_action :authenticate_admin!
	
	def index
		@freelances = Freelance.all.order(created_at: :desc)
	end

	def new
		@freelance = Freelance.new
	end

	def create
	  @freelance = Freelance.new(freelance_params)
	  if @freelance.save
	  	redirect_to admin_freelances_path, notice: t('.created', model: @freelance.class.model_name.human)
	  else
	    render :new, notice: t('.error', model: @freelance.class.model_name.human)
	  end
	end

	def edit
		@freelance = Freelance.find(params[:id])
	end

	def update
		@freelance = Freelance.find(params[:id])
	  if @freelance.update(freelance_params)
	    redirect_to admin_freelances_path
	  else
	    render :edit
	  end
	end

	def destroy
	  @freelance = Freelance.find(params[:id])
	  @freelance.destroy
	  redirect_to admin_freelances_path
	end

	def freelance_params
	  params.require(:freelance).permit(:name, :last_name, :phone, :city, :country, :email, :f_role_id, :gender, :password,:password_confirmation)
	end

end