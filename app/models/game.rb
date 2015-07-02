class Game
  include Mongoid::Document
  include Mongoid::Timestamps

  #has_one :game_stat, :class_name => 'Game::Stat'

  field :title, type: String
  field :short_title, type: String
  field :description , type: String
  field :slug, type: String
end