class Admin::DaycaresController < ApplicationController
  def index
    @daycares = Daycare.all
    @daycare = Daycare.new
  end

  def new
    @daycare = Daycare.new
  end

  def create
    @daycare = Daycare.new(daycare_params)
    @daycare.save
    #binding.pry
    redirect_to admin_daycare_path(@daycare)
  end

  def show
    @daycare = Daycare.find(params[:id])
    @daycares = Daycare.all
  end

  def edit
    @daycare = Daycare.find(params[:id])
  end

  def update
    @daycare = Daycare.find(params[:id])
    if @daycare.update(daycare_params)
      redirect_to admin_daycare_path(@daycare.id)
    else
      render edit
    end

  end
  private

    def daycare_params
      params.require(:daycare).permit(:daycare_name, :image, :description, :phone, :pattern, :dayaweek, :weekday, :sat, :sun, :capacity, :short_time)
    end
end
