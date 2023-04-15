class Public::DaycaresController < ApplicationController
  # before_action :authenticate_customer!, except: [:index, :show]

  def index
    @daycares = Daycare.all
    @daycare = Daycare.new
    @post_comment = PostComment.all
  end

  def show
    @daycare = Daycare.find(params[:id])
    @post_comment = PostComment.new
    @post = Daycare.find(params[:id])
  end
  
  private

  def daycare_params
    params.require(:daycare).permit(:title, :body, :star)
  end
end
