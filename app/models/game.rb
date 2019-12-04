class Game
  def initialize(game_json)
    @game_json = game_json
  end

  def home_team
    @home_team ||= Team.new(@game_json['h'])
  end

  def away_team
    @away_team ||= Team.new(@game_json['v'])
  end

  def home_team_name
    home_team.name
  end

  def away_team_name
    away_team.name
  end

  def game_time
    @game_json['etm']
  end

  def game_location
    home_team.city
  end
end
