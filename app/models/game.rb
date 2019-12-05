class Game
  attr_accessor :id, :game_json

  def initialize(game_json)
    @game_json = game_json
    @id = game_json['gid']
  end

  def home_team
    @home_team ||= Team.new(@game_json['h'])
  end

  def home_team_json
    TeamSerializer.new(home_team).serialized_json
  end

  def away_team
    @away_team ||= Team.new(@game_json['v'])
  end

  def away_team_json
    TeamSerializer.new(away_team).serialized_json
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
