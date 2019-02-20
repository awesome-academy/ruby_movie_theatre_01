class FilmsController < ApplicationController
  before_action :load_film, only: %i(show edit update destroy)
  before_action :logged_in_user
  before_action :admin_user, only: %i(edit update destroy)
  before_action :support

  def new
    @film = Film.new
  end

  def create
    @film = Film.new film_params

    if @film.save
      flash[:success] = t ".add_film_successful"
      redirect_to @film
    else
      flash.now[:danger] = t ".add_film_failure"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @film.update film_params
      flash[:success] = t ".film_update_successful"
      redirect_to @film
    else
      flash.now[:danger] = t ".film_update_failure"
      render :edit
    end
  end

  def destroy
    if @film.destroy
      flash[:success] = t ".film_del"
      redirect_to films_path
    else
      flash[:danger] = t ".film_del_fail"
    end
  end
  private

  def film_params
    params.require(:film).permit Film::FILM_PARAMS
  end

  def load_film
    @film = Film.find_by id: params[:id]

    return if @film
    flash[:danger] = t ".film_not_found"
    redirect_to root_path
  end
  
  def support
    @supports = Supports::FilmSupports.new @film
  end

end
