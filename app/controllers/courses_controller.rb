class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:success] = 'Course Created'
      redirect_to course_path(@course)
    else
      render :new
  end

  def edit
  end

  def update
    if @course.update(course_params)
      flash[:success] = 'Course Updated'
      redirect_to course_path(@course)
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    flash[:success] = 'Course Destroyed'
    redirect_to courses_path
  end

  private

  def course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :size, :subject)
  end
end
