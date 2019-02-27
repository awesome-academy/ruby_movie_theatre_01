class StaticPagesController < ApplicationController
  def home
    @film = Film.last(3).reverse
  end

  def show
    render template: "static_pages/#{params[:page]}"
  end
end
