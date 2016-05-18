class CommentsController < ApplicationController
  def create
    @comment = Comment.create(review: comment_params[:review], restaurant_id: comment_params[:restaurant_id], user_id: current_user.id)
    redirect_to "/gourmet_info/restaurants/#{@comment.restaurant.id}"
  end

  private
  def comment_params
    params.permit(:text, :restaurant_id)
  end
end
