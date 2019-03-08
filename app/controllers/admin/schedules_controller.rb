class Admin::SchedulesController < ApplicationController
  before_action :load_schedule, only: %i(show edit update destroy)
  before_action :logged_in_user
  before_action :admin_user, only: %i(new create edit update destroy)
  before_action :find_film, only: %i(new create)
  before_action :load_type_schedule, only: %i(new create)

  def new
    @schedule = @film.schedules.build
  end

  def create
    @schedule = @film.schedules.build schedule_params
    @schedule.room_id = schedule_params[:room_id]

    if @schedule.save
      flash[:success] = t ".add_schedule_successful"
      redirect_to admin_film_path @film
    else
      flash.now[:danger] = t ".add_schedule_failure"
      render :new
    end
    @schedules = @film.schedules
  end

  def show; end

  def edit; end

  def update
    if @schedule.update schedule_params
      flash[:success] = t ".schedule_update_successful"
      redirect_to admin_film_path(@schedule.film) || root_url
    else
      flash.now[:danger] = t ".schedule_update_failure"
      render :edit
    end
  end

  def destroy
    if @schedule.destroy
      flash[:success] = t ".schedule_del"
      redirect_to request.referrer || root_url
    else
      flash[:danger] = t ".schedule_del_fail"
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit Schedule::SCHEDULE_PARAMS
  end

  def load_schedule
    @schedule = Schedule.find_by id: params[:id]

    return if @schedule
    flash[:danger] = t ".schedule_not_found"
    redirect_to admin_film_path
  end

  def find_film
    @film = Film.find_by id: params[:film_id]

    return if @film
    flash[:danger] = t ".film_not_found"
    redirect_to admin_films_path
  end

  def load_type_schedule
    @room_type = Schedule.type_schedules
  end
end
