class Admin::ServicesController < ApplicationController
	layout 'admin'
	before_action :authenticate_admin!

	def index
		@services = Service.all.order(created_at: :desc)
		
	end

	def new
		@service = Service.new
		@service.deliveries.build
	end

	def create
	  @service = Service.new(service_params)
	  if @service.save
      redirect_to admin_services_path, notice: t('.created', model: @service.class.model_name.human)
	  else
	    render :new
	  end
	end

	def edit
		@service = Service.find(params[:id])
	end

	def update
		@service = Service.find(params[:id])
	  if @service.update(service_params)
	    redirect_to admin_services_path, notice: t('.created', model: @service.class.model_name.human)
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @service = Service.find(params[:id])
	  @service.deliveries.destroy_all
	  @service.destroy
	  redirect_to admin_services_path, notice: t('.created', model: @service.class.model_name.human)
	end

  private
		def service_params
		  params.require(:service).permit(:name, :category_id, :bundle_id, :img, :imghover, deliveries_attributes: [ :id, :name, :price, :description, :_destroy])
		end
end
