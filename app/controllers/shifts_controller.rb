# encoding: utf-8
class ShiftsController < ApplicationController

  def index
    @shifts = Shift.all
  end

  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(params[:shift].slice(:date, :time))
    @shift.master = Person.find(params[:shift][:master])
    if @shift.save
      flash[:alert] = 'Смена успешно создана'
      redirect_to :shifts
    else
      flash[:alert] = 'Произошла ошибка'
      render :new
    end
  end

  def update
  end

  def destroy
    @shift = Shift.destroy(params[:id])
    redirect_to :shifts
  end

end
