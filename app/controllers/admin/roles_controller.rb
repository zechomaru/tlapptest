class Admin::RolesController < ApplicationController
		layout 'admin'
	before_action :authenticate_admin!
	
	def index
		@roles = Role.all.order(created_at: :desc)
	end

	def new
		@role = Role.new
	end

	def create
	  role = Role.new(roles_params)
	  if role.save
	  	redirect_to admin_roles_path
	    message = "Role creado"
	  else
	    message = "Error al crear el Role"
	  end
	end

	def edit
		@role = Role.find(params[:id])
	end

	def update
		@role = Role.find(params[:id])
	  if @role.update(roles_params)
	    redirect_to admin_roles_path
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @role = Role.find(params[:id])
	  @role.destroy
	  redirect_to admin_roles_path
	end

	def roles_params
	  params.require(:role).permit(:name)
	end

end
