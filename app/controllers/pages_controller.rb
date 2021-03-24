class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def show
    render template: "pages/plug"
  end
end
