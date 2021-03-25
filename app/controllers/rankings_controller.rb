class RankingsController < ApplicationController
  def index
    @blogs = policy_scope(Blog).order(created_at: :desc)
    @ranking = Ranking.first
  end

  def show
  end

  def new
  end

  def create
  end


  def edit
  end

  def update
  end

  def destroy

  end
end

