class TeamSerializer
  include FastJsonapi::ObjectSerializer

  attribute :city, &:city

  attribute :name, &:name

  attribute :record, &:record
end
