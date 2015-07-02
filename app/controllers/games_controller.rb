class GamesController < ApplicationController
  def index
  	@team_name = team_name
  	#array
  	@gs = Game.all
  end

  def new
  	@game = Game.new
  end

  def edit
    @game = Game.where(:id => params[:id]).first
  end

  def game_create
  	@game = Game.new(game_params)
  	@game.save

  	redirect_to root_url
  end

  def game_edit
    @game = Game.where(:id => params[:id])
    
    if @game.update(game_params)
        redirect_to root_url
    else
      render :edit
    end
    
  end

  private

  def game_params
  	params.require(:game).permit(:title, :short_title, :description)
	end
end
