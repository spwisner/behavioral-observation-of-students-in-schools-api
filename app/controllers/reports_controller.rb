# frozen_string_literal: true

class ReportsController < OpenReadController
  before_action :set_report, only: [:show, :update, :destroy]
  before_action :set_student, only: [:index, :create]
  before_action :set_session, only: [:index, :create]

  # GET /reports
  def index
    @reports = @session.reports
    render json: { reports: @reports }
  end

  # GET /reports/1
  def show
    render json: @report
  end

  # POST /reports
  def create
    @report = current_user.reports.build(report_params)
    @report.session = @session
    @report.student = @student

    if @report.save
      render json: @report, status: :created, location: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reports/1
  def update
    if @report.update(report_params)
      render json: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reports/1
  def destroy
    @report.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def set_student
    @student = current_user.students.find(params[:student_id])
  end

  def set_session
    @session = current_user.sessions.find(params[:session_id])
  end

  def set_report
    @report = Report.where(id: params[:id], user: current_user).take
  end

  # Only allow a trusted parameter "white list" through.
  def report_params
    params.require(:report).permit(:presenting_issue, :class_behav_assess,
                                   :r_setting, :r_aet, :r_pet, :r_oftm, :r_oftv,
                                   :r_oftp, :r_finding, :r_customone,
                                   :r_customtwo, :r_customthree,
                                   :r_recommendation,
                                   :counselor_name)
  end
end
