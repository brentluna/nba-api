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

    puts month_array

    month_array
  end

  def group_by_month(schedule)
    schedule['lscd'].map do |el|
      { month: el['mscd']['mon'], games: el['mscd']['g'] }
    end
  end

  def format_games(schedule)
    schedule.map do |month|
      games = month['games']
      month['games'] = games.map { |game| }
    end
  end

  def format_game(game); end
end
