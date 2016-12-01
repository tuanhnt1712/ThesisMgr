class Admin::CoursesController < ApplicationController
  before_action :find_course, only: [:show, :edit, :update, :destroy]
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find_by(id: params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to admin_courses_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update_attributes(course_params)
      redirect_to [:admin, @course]
    else
      render :edit
    end
  end

  def destroy
    if @course.destroy
      redirect_to admin_courses_path
    else
      redirect_to admin_courses_path
    end
  end

  private
  def course_params
    params.require(:course).permit(:name)
  end
  def find_course
    @course = Course.find_by(id: params[:id])
  end
end