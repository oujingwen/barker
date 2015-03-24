class TimelinesController < ApplicationController

  def show
    @user_id = params[:id]
    if @user_id
      @barks = Bark.where(user_id: @user_id)
    end
    respond_to do |format|
      format.html
      format.xml  { render :xml => @barks }
    end
  end
end
