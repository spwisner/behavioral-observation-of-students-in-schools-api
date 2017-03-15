# frozen_string_literal: true

class SessionsController < OpenReadController
  before_action :set_session, only: [:show, :update, :destroy]
  before_action :set_student, only: [:index, :create]

  # GET /sessions
  def index
    @sessions = @student.sessions
    render json: { sessions: @sessions }
  end

  # GET /sessions/1
  def show
    render json: @session
  end

  # POST /sessions
  def create
    @session = current_user.sessions.build(session_params)
    @session.student = @student

    if @session.save
      render json: @session, status: :created, location: @session
    else
      render json: @session.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sessions/1
  def update
    if @session.update(session_params)
      render json: @session
    else
      render json: @session.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sessions/1
  def destroy
    @session.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_session
    @session = Session.where(id: params[:id], user: current_user).take
  end

  def set_student
    @student = current_user.students.find(params[:student_id])
  end

  # Only allow a trusted parameter "white list" through.
  def session_params
    params.require(:session).permit(:obs_on, :obs_session, :obs_task, :int_num,
                                    :obs_time)
  end
end
