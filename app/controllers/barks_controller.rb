class BarksController < ApplicationController

  def index
    @barks = Bark.all
  end

  def new
    @bark = Bark.new
  end

  def create
    @bark = Bark.new(bark_params)
    if session[:id]
      @bark.user_id = session[:id]
    end
    respond_to do |format|
      if @bark.save
        format.html { redirect_to(timelines_path + '/' + session[:id].to_s) }
      else
        format.xml { render :action => "new" }
      end
    end
  end

  private

  def bark_params
    params.require(:bark).permit(:status, :user_id)
  end
end
