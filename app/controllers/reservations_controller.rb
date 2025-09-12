class ReservationsController < ApplicationController
  def index
    @reservations = Reservations.all
  end

  def show
    @reservation = Reservations.find(params[:id])
  end
end
