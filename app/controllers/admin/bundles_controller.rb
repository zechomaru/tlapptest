class Admin::BundlesController < ApplicationController
	layout 'admin'
	before_action :authenticate_admin!

	def index
		@bundles = Bundle.all.order(created_at: :desc)
		
	end

	def new
		@bundle = Bundle.new
	end

	def create
	  bundle = Bundle.new(bundle_params)
	  if bundle.save
      redirect_to admin_bundles_path
	  else
	    render 'new'
	  end
	end

	def edit
		@bundle = Bundle.find(params[:id])
	end

	def update
		@bundle = Bundle.find(params[:id])
	  if @bundle.update(bundle_params)
	    redirect_to admin_bundles_path
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @bundle = Bundle.find(params[:id])
	  @bundle.destroy
	  redirect_to admin_bundles_path
	end

  private
		def bundle_params
		  params.require(:bundle).permit(:name, :price, :img, :imghover, service_ids: [] )
		end
end
