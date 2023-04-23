class Public::DaycaresController < ApplicationController
  # before_action :authenticate_customer!, except: [:index, :show]

  def index
    @daycares = Daycare.all
    @daycare = Daycare.new
    @comments = Comment.all
    @daycares = @daycares.where('daycare_name LIKE ?', "%#{params[:search]}%") if params[:search].present?
  end

  def show
    @daycare = Daycare.find(params[:id])
    @comments = Comment.where(daycare_id: params[:id])
    @comment = Comment.new
    if params[:format] === "desc"
      # 降順
      @comments = @daycare.comments.order("rate DESC")
    elsif params[:format] === "asc"
      ## 昇順
      @comments = @daycare.comments.order("rate ASC")
    end
  end

  private

  def daycare_params
    params.require(:daycare).permit(:title, :body, :star)
  end
end
