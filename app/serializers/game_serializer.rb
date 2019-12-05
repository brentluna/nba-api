class GameSerializer
  include FastJsonapi::ObjectSerializer

  attribute :home_team, &:home_team
  attribute :away_team, &:away_team

  attribute :home_team_json, &:home_team_json
  attribute :away_team_json, &:away_team_json

  attribute :home_team_name, &:home_team_name
  attribute :away_team_name, &:away_team_name
  attribute :game_time, &:game_time
  attribute :game_location, &:game_location
end
