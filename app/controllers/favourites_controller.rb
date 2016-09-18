class FavouritesController < ApplicationController
    before_action :authenticate_user!

    def create
      favourite      = current_user.favourites.new
      project      = Project.find params[:project_id]
      favourite.project = project
      if favourite.save
        redirect_to project, notice: "You have favourited this project!"
      else
        redirect_to project, alert: "Can't Favourite!"
      end
    end

    def destroy
      project = Project.find params[:project_id]
      favourite = current_user.favourites.find params[:id]
      favourite.destroy
      redirect_to project, notice: "You have unfavourited this project."
    end

end
