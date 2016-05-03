class Freelance::DashboardController < ApplicationController
	layout 'freelance'
	before_action :authenticate_freelance!
	def index

	end
end
