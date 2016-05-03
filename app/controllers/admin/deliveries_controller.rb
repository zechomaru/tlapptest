class Admin::DeliveriesController < ApplicationController
	layout 'admin'
	before_action :authenticate_admin!

	def index
		@deliveries = Delivery.all.order(created_at: :desc)
		
	end

	def new
		@delivery = Delivery.new
	end

	def create
	  delivery = Delivery.new(delivery_params)
	  if delivery.save
      redirect_to admin_deliveries_path
	  else
	    render 'new'
	  end
	end

	def edit
		@delivery = Delivery.find(params[:id])
	end

	def update
		@delivery = Delivery.find(params[:id])
	  if @delivery.update(delivery_params)
	    redirect_to admin_deliveries_path
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @delivery = Delivery.find(params[:id])
	  @delivery.destroy
	  redirect_to admin_deliveries_path
	end

  private
		def delivery_params
		  params.require(:delivery).permit(:name, :image)
		end
end
