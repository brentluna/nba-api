class Team
  def initialize(team_json)
    @team_json = team_json
  end

  def city
    @team_json['tc']
  end

  def name
    @team_json['tn']
  end

  def record
    @team_json['re']
  end
end
