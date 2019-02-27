class SchedulesController < ApplicationController
  before_action :load_schedule, only: %i(show)
  before_action :logged_in_user

  def show; end

  private

  def load_schedule
    @schedule = Schedule.find_by id: params[:id]

    return if @schedule
    flash[:danger] = t ".schedule_not_found"
    redirect_to admin_films_path
  end
end
