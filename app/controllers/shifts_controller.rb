# encoding: utf-8
class ShiftsController < ApplicationController

  before_filter :require_user

  def index
    @start_date = params[:start_date] || (DateTime.now - 100.days).to_s(:short_date)
    @finish_date = params[:finish_date] || DateTime.now.to_s(:short_date)
    @shifts = Shift.in_period(@start_date, @finish_date)
  end

  def new
    @shift = Shift.new
    @shift.person_shifts = []
  end

  def edit
    @shift = Shift.find(params[:id])
  end

  def trips
    trips_data = Trip.for_shift(params[:date], params[:time]).group_by(&:vehicle)
    @person_shifts = []
    trips_data.each do |vehicle, trips|
      @person_shifts << PersonShift.new(:vehicle => vehicle, :trips_count => trips.count)
    end
  end

  def update
    @shift = Shift.find(params[:id])
    @shift.master = Master.find(params[:shift].delete( :master ))
    @shift.build_person_shifts(params[:person_shifts])
    if @shift.update_attributes(params[:shift])
      flash[:alert] = 'Смена успешно сохранена'
      redirect_to :shifts
    else
      flash[:alert] = 'Произошла ошибка'
      redirect_to :shifts
    end
  end

  def show
    @shift = Shift.find(params[:id])
  end

  def create
    @shift = Shift.new(params[:shift].slice(:date, :time))
    @shift.master = Master.find(params[:shift][:master])
    @shift.build_person_shifts(params[:person_shifts])
    if @shift.save
      flash[:alert] = 'Смена успешно создана'
      redirect_to :shifts
    else
      flash[:alert] = 'Произошла ошибка'
      render :new
    end
  end

  def destroy
    @shift = Shift.destroy(params[:id])
    redirect_to :shifts
  end

end
