class Team
  attr_accessor :id, :team_json
  def initialize(team_json)
    @team_json = team_json
    @id = team_json['tid']
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
