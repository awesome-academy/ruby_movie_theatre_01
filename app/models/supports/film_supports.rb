class Supports::FilmSupports
  attr_reader :film

  def initialize film
    @film = film
  end

  def statuses_film
    @statuses_film ||= Film.statuses.map do |key, _value|
      [I18n.t("film.#{key}"), key]
    end
  end

  def type_file
    @type_file ||= Film.type_films.keys
  end
end
