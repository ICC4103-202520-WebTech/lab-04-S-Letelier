class RoomsController < ApplicationController
  def index
    @rooms = Rooms.all
  end

  def show
    @room = Rooms.find(params[:id])
  end
end
