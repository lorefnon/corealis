class OpeningsController < ApplicationController

  def index
    @openings = Opening.order('id desc').page params[:page]
  end

end
