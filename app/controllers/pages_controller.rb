class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :plug, :podcast, :about]

  def home
  end

  def plug
    render template: "pages/plug"
  end

  def podcast
    render template: "pages/podcast"
  end

  def about
    render template: "pages/about"
  end

  # def rankings
  #   render template: "pages/rankings"
  # end
end
