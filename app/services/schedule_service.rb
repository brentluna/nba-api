require './app/serializers/game_serializer'
class ScheduleService
  SCHEDULE_URL =
    'https://data.nba.com/data/10s/v2015/json/mobile_teams/nba/2019/league/00_full_schedule_week.json'

  def schedule
    request.success? ? parse_request(request.body) : []
  end

  private

  def request
    @request ||= HTTParty.get(SCHEDULE_URL)
  end

  def parse_request(request)
    req_json = JSON.parse(request)
    month_array = group_by_month(req_json)
    formatted_games = format_games(month_array)
  end

  def group_by_month(schedule)
    # schedule['lscd'].map do |el|
    #   { month: el['mscd']['mon'], games: el['mscd']['g'] }
    # end

    schedule['lscd'].reduce([]) do |res, el|
      # { month: el['mscd']['mon'], games: el['mscd']['g'] }
      res.concat(el['mscd']['g'])
    end
  end

  def format_games(games)
    # schedule.map do |month|
    #   games = month[:games]
    #   month[:games] =
    games.map do |game|
      game = Game.new(game)
      # GameSerializer.new(game).serialized_json
      GameSerializer.new(game).serializable_hash
    end
    # end
  end
  # def format_games(schedule)
  #   schedule.map do |month|
  #     games = month[:games]
  #     month[:games] =
  #       games.map do |game|
  #         game = Game.new(game)
  #         # GameSerializer.new(game).serialized_json
  #         GameSerializer.new(game).serializable_hash
  #       end
  #   end
  # end
end
