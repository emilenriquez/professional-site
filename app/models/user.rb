class User
  include Mongoid::Document
  include Mongoid::Timestamps

  #has_one :game_stat, :class_name => 'Game::Stat'

  field :username, type: String
  field :email, type: String
  field :website , type: String
  field :facebook_url, type: String
end