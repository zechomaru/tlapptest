class Admin::FormBuildsController < ApplicationController
		layout 'admin'
	before_action :authenticate_admin!
	
	def index
    @surveys = FormBuild.all
  end

  def show
    @survey = FormBuild.find(params[:id])
  end

  def new
    @survey = FormBuild.new
    @survey.questions.build
  end

  def create
    @survey = FormBuild.new(form_build_params)
    if @survey.save
      redirect_to admin_form_builds_path, notice: 'Survey was successfully created.'
    else
      render :new
    end
  end

  def edit
    @survey = FormBuild.find(params[:id])
  end

  def update
    @survey = FormBuild.find(params[:id])
    if @survey.update(form_build_params)
      redirect_to admin_form_builds_path, notice: 'Survey was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @survey = FormBuild.find(params[:id])
    @survey.questions.destroy_all
    @survey.destroy
      redirect_to admin_form_builds_path, notice: 'Survey was successfully destroyed.'
  end

  private
    def form_build_params
      params.require(:form_build).permit(:name, :service_id, questions_attributes: [ :id, :content, :_destroy])
    end

end
