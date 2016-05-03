class Admin::DashboardController < ApplicationController
	layout 'admin'
	before_action :authenticate_admin!
	def index
		@pagesCount = Page.where(visibility: true).count
		@FreelancesCount = Freelance.count
		@orders = Form.all

		respond_to do |format|
    format.html
     @orders = @orders.map{ |u| { id: u.id, service: u.form_build.service.name, status: u.status_order.name } }
     format.json { render json: @orders.to_json } 
  	end
	end
end

