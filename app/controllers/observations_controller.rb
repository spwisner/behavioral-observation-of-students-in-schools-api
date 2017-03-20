# frozen_string_literal: true

class ObservationsController < OpenReadController
  before_action :set_observation, only: [:show, :update, :destroy]
  before_action :set_student, only: [:index, :create]
  before_action :set_session, only: [:index, :create]

  # GET /observations
  def index
    @observations = @session.observations
    # @observations = @student.observations
    render json: { observations: @observations }
    # @observations = current_user.observations
    # render json: @observations
  end

  # GET /observations/1
  def show
    render json: @observation
  end

  # POST /observations
  def create
    @observation = current_user.observations.build(observation_params)
    @observation.session = @session
    @observation.student = @student

    # Check if session completed
    curr_session_id = @observation.session.id
    curr_session_int_total = @session.int_num
    curr_obs_num = @observation.obs_num
    curr_count = Observation.where(session_id: curr_session_id).count
    @observation.obs_num = curr_count + 1

    if curr_session_int_total == curr_obs_num
      @session.completed = true
    else
      @session.completed = false
    end

    save_observation = (@observation.obs_num <= curr_session_int_total)

    # end of session completed
    binding.pry
    if @observation.save && save_observation
      binding.pry
      render json: @observation, status: :created
    else
      render json: @observation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /observations/1
  def update
    if @observation.update(observation_params)
      render json: @observation
      # render json: @observation, status: :ok
    else
      render json: @observation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /observations/1
  def destroy
    @observation.destroy
    head :no_content
  end

  private

  def set_student
    @student = current_user.students.find(params[:student_id])
  end

  def set_session
    @session = current_user.sessions.find(params[:session_id])
  end

  def set_observation
    # @observation = Observation.find(params[:id])
    @observation = Observation.where(id: params[:id], user: current_user).take
  end

  def observation_params
    params.require(:observation).permit(:aet, :pet, :oft_m, :oft_v,
                                        :oft_p, :obs_comment, :obs_num)
  end

  # private :set_observation, :observation_params
end
