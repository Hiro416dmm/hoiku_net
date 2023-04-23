class Public::CommentsController < ApplicationController
  def create
    daycare = Daycare.find(params[:daycare_id])
    comment = current_user.comments.new(comment_params)
    comment.daycare_id = daycare.id
    comment.save
    redirect_to daycare_path(daycare)
    # else
    #   redirect_back(fallback_location: root_path)  #同上
    # end
  end

  def destroy
    PostComment.find_by(id: params[:id], daycare_id: params[:post_id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :post_id, :rate)
  end
end
