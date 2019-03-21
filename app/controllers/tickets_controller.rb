class TicketsController < ApplicationController
  before_action :load_schedule
  before_action :logged_in_user

  def index; end

  def new
    @ticket = @schedule.tickets.build
  end

  def create
    if current_user.wallet >= (params["positions"].length * 50_000)
      tao_ve
      tinh_tien
      flash[:success] = t ".thanh_cong"
    else
      flash[:danger] = t ".so_du_tk_ko_du"
      nil
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit Ticket::TICKET_PARAMS
  end

  def load_ticket
    @ticket = Ticket.find_by id: params[:id]

    return if @ticket
    flash[:danger] = t ".ticket_not_found"
    redirect_to root_path
  end

  def load_schedule
    @schedule = Schedule.find_by id: params[:schedule_id]

    return if @schedule
    flash[:danger] = t ".schedule_not_found"
    redirect_to admin_film_path
  end

  def tinh_tien
    current_user.update(wallet: current_user.wallet -
                          (params["positions"].length * 50_000))
  end

  def tao_ve
    params["positions"].each do |position|
      seat = @schedule.room.seats.find_by position: position
      @ticket = @schedule.tickets.build seat: seat,
        user: current_user, soldtime: Time.now
      @ticket.save
    end
  end
end
