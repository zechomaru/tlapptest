class Admin::FRolesController < ApplicationController
		layout 'admin'
	before_action :authenticate_admin!
	
	def index
		@roles = FRole.all.order(created_at: :desc)
	end

	def new
		@role = FRole.new
	end

	def create
	  role = FRole.new(roles_params)
	  if role.save
	  	redirect_to admin_f_roles_path
	    message = "Role creado"
	  else
	    render :new
	  end
	end

	def edit
		@role = FRole.find(params[:id])
	end

	def update
		@role = FRole.find(params[:id])
	  if @role.update(roles_params)
	    redirect_to admin_f_roles_path
	  else
	    render :edit
	  end
	end

	def destroy
	  @role = FRole.find(params[:id])
	  @role.destroy
	  redirect_to admin_f_roles_path
	end

	def roles_params
	  params.require(:f_role).permit(:name)
	end

end
