class ProjectsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy

  def create
     @project = current_user.projects.build(params[:project])
     if @project.save
       flash[:success] = "Project created!"
       redirect_to root_path
     else
       @feed_items = []
       render 'pages/home'
     end
   end

   def destroy
       @project.destroy
       redirect_back_or root_path
     end
     private

         def authorized_user
           @project = current_user.projects.find_by_id(params[:id])
           redirect_to root_path if @project.nil?
         end
     
end