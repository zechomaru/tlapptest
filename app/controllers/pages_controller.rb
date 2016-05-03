class PagesController < ApplicationController

	def show
		@page = Page.find_by_url(params[:url])
    @form = FormQuestion.where(form_build_id = @page.form_build_id)
		@formDelivery = FormBuild.find_by_id(@page.form_build_id)
		@answer = Form.new
    @answer.answers.build

  end

  def create
    @answer = Form.new(form_params)
    if @answer.save
      redirect_to root_path, notice: 'Survey was successfully created.'
    else
      puts "----------------" + @answer.form_build_id
    end
  end

  private

    def form_params
      params.require(:form).permit(:form_build_id, :status_order_id, answers_attributes: [ :id, :content, :_destroy])
    end

end
