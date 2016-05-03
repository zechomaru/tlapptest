class HomeController < ApplicationController

  def index
  	@pagesServices = Page.where(visibility: true).where.not(service_id: nil)
  	@pagesBundles = Page.where(visibility: true).where.not(bundle_id: nil)

  end
  
end
