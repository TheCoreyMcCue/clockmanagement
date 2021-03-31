class RankingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_ranking, only: %i[show edit update destroy]
  def index
    @ranking = policy_scope(Ranking).last
    # @ranking = Ranking.first
  end

  def show
  end

  def new
    @ranking = Ranking.new
    authorize(@ranking)
  end

  def create
    @ranking = Ranking.new(ranking_params)
    @user = current_user
    authorize @ranking
    @ranking.save
    redirect_to rankings_url
  end

  def edit
    authorize(@ranking)
  end

  def update
    authorize(@ranking)
    @ranking.update(ranking_params)
    @ranking.save
    redirect_to rankings_url
  end

  def destroy
    authorize(@ranking)
    @ranking.destroy
    redirect_to rankings_url
  end
end

private

  def set_ranking
    @ranking = Ranking.find(params[:id])
  end

def ranking_params
  params.require(:ranking).permit(:weekly_data)
end
