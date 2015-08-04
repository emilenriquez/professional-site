class WelcomeController < ApplicationController
	before_action :set_default_meta_tags
  def index
  	@tag_line = 'Turning caffeine into awesome web and mobile apps'

  end
end
