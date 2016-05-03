class Admin::AdminsController < ApplicationController
	layout 'admin'
	before_action :authenticate_admin!
	
	def index
		@admins = Admin.all.order(created_at: :desc)
	end

	def new
		@admin = Admin.new
	end

	def show
		
	end

	def create
	  @admin = Admin.new(admin_params)
	  if @admin.save
	  	redirect_to admin_admins_path, notice: t('.created', model: @admin.class.model_name.human)
	  else
	    render :new
	  end
	end

	def edit
		@admin = Admin.find(params[:id])
	end

	def update
		@admin = Admin.find(params[:id])
	  if @admin.update(admin_params)
	    redirect_to admin_admins_path
	  else
	    render :edit
	  end
	end

	def destroy
	  @admin = Admin.find(params[:id])
	  @admin.destroy
	  redirect_to admin_admins_path
	end

	def admin_params
	  params.require(:admin).permit(:name, :last_name, :email, :country, :city, :phone, :role_id, :gender, :password,:password_confirmation)
	end

end