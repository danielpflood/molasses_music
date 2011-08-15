class PagesController < ApplicationController

  def home
      @title = "Home"
      @upload  = Upload.new
      if signed_in?
        @project = Project.new
        @feed_items = current_user.feed.paginate(:page => params[:page])
      end
    end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end
  
  def news
     @title = "News"
   end
end