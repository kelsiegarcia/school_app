class SchoolsController < ApplicationController
  before_action :school, except: [:index, :new, :create]
  
  def index
    @schools = School.all
  end

  def show
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      flash[:success] = 'School Created'
      redirect_to school_path(@school)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @school.update(school_params)
      flash[:success] = 'School Updated'
      redirect_to school_path(@school)
    else
      render :edit
    end
  end

  def destroy
    @school.destroy
    flash[:success] = 'School Destroyed'
    redirect_to schools_path
  end


  private
    def school
       @school = School.find(params[:id])
    end

    def school_params
      params.require(:school).permit(:name, :population, :city, :state)
    end
end
