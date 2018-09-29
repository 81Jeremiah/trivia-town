class GamesController < ApplicationController

    def new
      game = Game.create(user_id: params[:user_id], attraction_id: params[:attraction_id])

    end

end
