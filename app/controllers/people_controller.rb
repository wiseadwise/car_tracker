# encoding: utf-8
class PeopleController < ApplicationController

  before_filter :set_person, :set_people

  def index
  end

  def create
    role = params[:person].delete(:role).classify.constantize
    @person = role.new(params[:person])
    if @person.save
      flash[:notice] = "Работник успешно добавлен"
      redirect_to :people
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

  def shifts
    @person = Person.find(params[:id])
    @shift = Shift.find(params[:shift_id]) if params[:shift_id]
    @trips = @person.trips(@shift) if @shift
    @shifts = @person.shifts
    @start_date = params[:start_date] || (DateTime.now - 100.days).to_s(:short_date)
    @finish_date = params[:finish_date] || DateTime.now.to_s(:short_date)
    @shifts = @shifts.in_period(@start_date, @finish_date) if request.post?
  end

  def update
    if @person.update_attributes(params[:person])
      flash[:notice] = "Работник успешно изменен"
      redirect_to :people
    else
      flash.now[:alert] = "Произошла ошибка"
      render :index
    end
  end

  def destroy
    if @person.destroy
      flash[:notice] = "Работник успешно удален"
      redirect_to :people
    else
      flash.now[:alert] = "Произошла ошибка"
      render :index
    end
  end

  protected

  def set_person
    @person = params[:id] ? Person.find(params[:id]) : Person.new
  end

  def set_people
    @people = Person.employee.order("last_name ASC").all
  end
end
