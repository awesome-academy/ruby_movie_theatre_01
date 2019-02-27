class PostersController < ApplicationController
  def new
    @poster = Poster.new
  end

  def create
    @poster = Poster.new poster_params

    if @poster.save
      flash[:success] = t ".add_poster_successful"
      redirect_to root_path
    else
      flash.now[:danger] = t ".add_poster_failure"
      render :new
    end
  end

  private

  def poster_params
    params.require(:poster).permit(:link)
  end
end
