class OpeningsController < ApplicationController

  layout 'single_panel'

  def index
    @openings = Opening.current.order('id desc').page params[:page]
  end

  def show
    @opening = Opening.current.find params[:id]
  end

end
