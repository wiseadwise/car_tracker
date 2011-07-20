# encoding: utf-8
class PeopleController < ApplicationController

  before_filter :set_person, :set_people

  def index
  end

  def create
    @person = Person.new(params[:person])
    if @person.save
      flash[:notice] = "Работник успешно создан"
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
