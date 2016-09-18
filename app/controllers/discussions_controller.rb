class DiscussionsController < ApplicationController

  def create
     @project = Project.find params[:project_id]
     discussion_params = params.require(:discussion).permit(:title, :description)
     @discussion   = Discussion.new discussion_params
     @discussion.project = @project
     respond_to do |format|
       if @discussion.save
          format.html {redirect_to project_path(@project), notice "Answer created successfully!"}
          format.js {render :create_success}
       else
          format.html {render "projects/show"}
          format.js {render :create_failure}
     end
   end

  def destroy
    @project = Project.find params[:project_id]
    @discussion = Discussion.find params[:id]
    @discussion.destroy
    redirect_to project_path(@project), notice: "Discussion Deleted"
  end

end
#
# class DiscussionsController < ApplicationController
#
#   def create
#      @project = Project.find params[:project_id]
#      discussion_params = params.require(:discussion).permit(:title, :description)
#      @discussion   = Discussion.new discussion_params
#      @discussion.project = @project
#      if @discussion.save
#        redirect_to project_path(@project), notice: "Discussion created!"
#      else
#        render "/projects/show"
#      end
#    end
#
#   def destroy
#     @project = Project.find params[:project_id]
#     @discussion = Discussion.find params[:id]
#     @discussion.destroy
#     redirect_to project_path(@project), notice: "Discussion Deleted"
#   end
#
# end
