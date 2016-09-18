class CommentsController < ApplicationController

  def create
      @discussion = Discussion.find params[:discussion_id]
      comment_params = params.require(:comment).permit(:body)
      @comment   = Comment.new comment_params
      @comment.discussion = @discussion
      respond_to do |format|
      if @comment.save
        format.html { redirect_to discussion_path(@discussion), notice: "Answer created successfully!" }
      format.js { render :create_success }
        # redirect_to discussion_path(discussion), notice: "Comment created!"
      else
        format.html { render "questions/show" }
      format.js   { render :create_failure }
        # render "/discussions/show"
      end
    end

  def destroy
    @discussion = Discussion.find params[:discussion_id]
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to discussion_path(@discussion), notice: "Comment Deleted"
  end

end
