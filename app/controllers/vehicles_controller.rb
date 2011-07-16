# encoding: utf-8
class VehiclesController < ApplicationController
  before_filter :require_user, :except => [ :index ]

  before_filter :set_vehicle, :set_vehicles

  def index
  end

  def create
    @vehicle = Vehicle.new(params[:vehicle])
    if @vehicle.save
      flash[:notice] = "Машина успешно создана"
      redirect_to :vehicles
    else
      flash.now[:alert] = "Произошла ошибка"
      render :index
    end
  end

  def edit
    render :index
  end

  def new
    render :index
  end

  def update
    if @vehicle.update_attributes(params[:vehicle])
      flash[:notice] = "Машина успешно изменена"
      redirect_to :vehicles
    else
      flash.now[:alert] = "Произошла ошибка"
      render :index
    end
  end

  def destroy
    if @vehicle.destroy
      flash[:notice] = "Машина успешно удалена"
      redirect_to :vehicles
    else
      flash.now[:alert] = "Произошла ошибка"
      render :index
    end
  end

  protected

  def set_vehicle
    @vehicle = params[:id] ? Vehicle.find(params[:id]) : Vehicle.new
  end

  def set_vehicles
    @vehicles = Vehicle.order("identifier ASC").all
  end

end
