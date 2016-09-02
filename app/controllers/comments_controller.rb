class CommentsController < ApplicationController

  def create
      @discussion = Discussion.find params[:discussion_id]
      comment_params = params.require(:comment).permit(:body)
      @comment   = Comment.new comment_params
      @comment.discussion = @discussion
      if @comment.save
        redirect_to discussion_path(discussion), notice: "Comment created!"
      else
        render "/discussions/show"
      end
    end

  def destroy
    @discussion = Discussion.find params[:discussion_id]
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to discussion_path(@discussion), notice: "Comment Deleted"
  end

end
