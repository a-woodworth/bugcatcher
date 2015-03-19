class ReportsController < ApplicationController

  before_action :set_project_and_release, :except => [:report_accepted, :report_denied]
  before_action :set_report, :only => [:show, :report_accepted, :report_denied]
  before_action :set_report_with_current_user, :only => [:edit, :destroy, :update]

  def new
    @report = Report.new
  end

  def show
    @comment = @report.comments.build
  end

  def edit
  end

  def update
    @report = Report.new(report_params)
    @report.save
    redirect_to project_release_report_url(params[:project_id], params[:release_id], @report)
  end

  def destroy
    @report.destroy
    flash[:notice] = "Report deleted successfully."
    redirect_to project_release_url(@project, @release)
  end

  def create
    @report = Report.new(report_params)
    @report.release_id = params[:release_id]
    @report.author = current_user
    @report.save
    redirect_to project_release_report_url(params[:project_id], params[:release_id], @report)
  end

  def report_accepted
    @report.accepted_by_project_owner = true
    @report.save
    respond_to do |format|
      format.js
    end
  end

  def report_denied
    @report.accepted_by_project_owner = false
    @report.save
    respond_to do |format|
      format.js
    end
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def set_report_with_current_user
    @report = current_user.reports.find(params[:id])
  end

  def set_project_and_release
    @project = Project.find(params[:project_id])
    @release = Release.find(params[:release_id])
  end

  def report_params
    params.require(:report).permit(:content)
  end

end
