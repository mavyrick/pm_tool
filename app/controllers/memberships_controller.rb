class MembershipsController < ApplicationController
  before_action :authenticate_user!

  def create
     membership      = current_user.memberships.new
     project      = Project.find params[:project_id]

     membership.project = project
     if membership.save
       redirect_to project, notice: "You are now a member of this project."
     else
       redirect_to project, alert: "Can't become a member!"
     end
   end

   def destroy
     project = Project.find params[:project_id]
     membership = current_user.memberships.find params[:id]
     membership.destroy
     redirect_to project, notice: "You are no longer a member of this project."
   end

 end
