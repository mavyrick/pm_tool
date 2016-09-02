class MembersController < ApplicationController
  before_action: authenticate_user!

  def create
     membership      = current_user.memberships.new
     project      = Project.find params[:project_id]

     membership.project = project
     if membership.save
       redirect_to project, notice: "Member"
     else
       redirect_to project, alert: "Can't become a member!"
     end
   end

   def destroy
     membership = current_user.likes.find params[:id]
     membership.destroy
     redirect_to project, notice: "Unliked"
   end

 end
