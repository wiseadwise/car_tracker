class VehiclesController < ApplicationController
  before_filter :set_vehicle, :set_vehicles

  def index
  end

  def create
    @vehicle = Vehicle.new(params[:vehicle])
    if @vehicle.save
      flash[:notice] = 'created'
      redirect_to :vehicles
    else
      flash.now[:alert] = 'error'
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
      flash[:notice] = 'updated'
      redirect_to :vehicles
    else
      flash.now[:alert] = 'error'
      render :index
    end
  end

  def destroy
    if @vehicle.destroy
      flash[:notice] = 'destroyed'
      redirect_to :vehicles
    else
      flash.now[:alert] = 'error'
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
