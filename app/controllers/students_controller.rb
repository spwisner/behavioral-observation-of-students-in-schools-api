# frozen_string_literal: true

class StudentsController < OpenReadController
  before_action :set_student, only: [:show, :update, :destroy]
  # GET /students
  def index
    @students = current_user.students
    render json: @students
  end

  # GET /students/1
  def show
    render json: @student
  end

  # DELETE /students/1
  def destroy
    @student.destroy
    head :no_content
  end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      render json: @student
      # head :no_content
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # POST /students
  def create
    @student = current_user.students.build(student_params)

    if @student.save
      render json: @student, status: :created
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student
    # @student = Student.find(params[:id])
    @student = Student.where(id: params[:id], user: current_user).take
  end

  # Only allow a trusted parameter "white list" through.
  def student_params
    params.require(:student).permit(:first_name, :last_name, :born_on,
                                    :school, :teacher, :grade)
  end
end
